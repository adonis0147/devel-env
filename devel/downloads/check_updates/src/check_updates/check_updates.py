import json
import logging
import os
import re
import textwrap
from ftplib import FTP

import packaging.version
import requests


def singleton(cls):
    instances = {}

    def get(*args, **kwargs):
        if cls not in instances:
            instances[cls] = cls(*args, **kwargs)
        return instances[cls]

    return get


@singleton
class GNUFTP:
    def __init__(self):
        self.ftp = FTP("ftp.gnu.org")
        self.ftp.login()


class GitHubGraphQL:
    def __init__(self):
        self.url = "https://api.github.com/graphql"
        self.token = os.getenv("GITHUB_TOKEN")

    def request(self, query: str, variables: dict):
        payload = {
            "query": textwrap.dedent(query).strip(),
            "variables": variables,
        }
        headers = {"Authorization": "Bearer {}".format(self.token)}
        response = requests.post(self.url, data=json.dumps(payload), headers=headers)
        response.raise_for_status()
        return response.json()

    def get_latest_version(self, owner: str, name: str) -> str:
        query = """
            query GetLatestTag($owner: String!, $name: String!) {
                repository(owner: $owner, name: $name) {
                    refs(refPrefix: "refs/tags/", orderBy: { field: TAG_COMMIT_DATE, direction: DESC }, first: 1) {
                        nodes {
                            name
                        }
                    }
                }
            }
        """
        variables = {"owner": owner, "name": name}
        response = self.request(query, variables)
        if "errors" in response:
            raise RuntimeError(response["errors"])
        return response["data"]["repository"]["refs"]["nodes"][0]["name"]


def get_all_urls(file: str) -> dict[str, str]:
    urls = dict()
    with open(file, "r") as f:
        for line in filter(lambda line: "_URL=" in line, f):
            package = line[: line.find("_PACKAGE_URL")]
            url = line[line.find("=") + 1 :].strip("'\n\"")
            urls[package] = url
    return urls


def check_gnu_package(package: str, url: str) -> bool:
    ftp = GNUFTP().ftp
    ftp.cwd("/gnu/{}".format(package.lower()))
    name = package.lower() if package != "WGET" else "wget2"

    def get_version(file):
        match = re.compile(r"{}-(\d+(\.\d+)*).*".format(name)).match(file)
        assert match is not None
        return match.group(1)

    versions = [
        get_version(file)
        for file in ftp.nlst()
        if re.compile(r"{}-(\d+(\.\d+)*).*\.tar\.gz".format(name)).match(file)
    ]
    versions.sort(key=packaging.version.parse)
    latest_version = versions[-1]
    file = os.path.basename(url)
    version = file[len(name) + 1 : -len(".tar.gz")]
    logging.log(
        logging.INFO if version == latest_version else logging.WARN,
        "Check {}: {} -> {}".format(package, version, latest_version),
    )
    return version != latest_version


def check_github_package(package: str, url: str) -> bool:
    match = re.compile(r"https://github.com/([^/]*)/([^/]*)/.*").match(url)
    assert match is not None
    owner, name = match.group(1), match.group(2)

    latest_version = GitHubGraphQL().get_latest_version(owner, name)
    if "/refs/tags/" in url:
        version = os.path.basename(url)[: -len(".tar.gz")]
    elif "/releases/download/" in url:
        match = re.compile(r".*/releases/download/([^/]+)/.*").match(url)
        assert match is not None
        version = match.group(1)
    logging.log(
        logging.INFO if version == latest_version else logging.WARN,
        "Check {}: {} -> {}".format(package, version, latest_version),
    )
    return version != latest_version


def check_updates(urls: dict[str, str]) -> tuple[list[str], list[str]]:
    checked = []
    updates = []
    for package, url in urls.items():
        if "ftpmirror.gnu.org" in url:
            if check_gnu_package(package, url):
                updates.append(package)
            checked.append(package)
        elif "github.com" in url:
            if check_github_package(package, url):
                updates.append(package)
            checked.append(package)
    return (updates, checked)


def main() -> int:
    logging.basicConfig(
        level=logging.INFO,
        format="[%(levelname)s] %(asctime)s - (%(filename)s:%(lineno)d) - %(message)s",
    )

    urls = get_all_urls(
        "{}/packages.sh".format(
            os.path.join(os.path.dirname(__file__), "..", "..", "data")
        )
    )
    updates, checked = check_updates(urls)

    logging.info("These packages should be updated: {}".format(" ".join(updates)))
    for package in checked:
        urls.pop(package)
    logging.info(
        "These packages should be checked manually: {}".format(" ".join(urls.keys()))
    )

    return 0
