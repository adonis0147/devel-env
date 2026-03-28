import json
import logging
import os
import re
import textwrap
from io import BytesIO

import packaging.version
import pycurl
import requests
from lxml import html


class GNUFTP:
    def __init__(self):
        self.url = "https://ftp.gnu.org/gnu"

    def list(self, package: str) -> list[str]:
        data = self._curl(f"{self.url}/{package.lower()}/")
        document = html.fromstring(data)
        return document.xpath("//td/a[not(@href='/gnu/')]/@href")

    def _curl(self, url: str) -> str:
        buffer = BytesIO()
        curl = pycurl.Curl()
        curl.setopt(pycurl.URL, url)
        curl.setopt(pycurl.WRITEDATA, buffer)
        curl.setopt(pycurl.SSLVERSION, pycurl.SSLVERSION_TLSv1_3)
        curl.perform()
        curl.close()
        return buffer.getvalue().decode()


class GitHubGraphQL:
    def __init__(self):
        self.url = "https://api.github.com/graphql"
        self.token = os.getenv("GITHUB_TOKEN")

    def _request(self, query: str, variables: dict):
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
        response = self._request(query, variables)
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
    name = package.lower() if package != "WGET" else "wget2"

    def get_version(file):
        match = re.compile(r"{}-(\d+(\.\d+)*).*".format(name)).match(file)
        assert match is not None
        return match.group(1)

    versions = [
        get_version(file)
        for file in GNUFTP().list(package)
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


def check_rust_package(package: str, url: str) -> bool:
    match = re.search(r"rust-(\d+\.\d+\.\d+)-", url)
    assert match is not None
    version = match.group(1)

    response = requests.get(
        "https://static.rust-lang.org/dist/channel-rust-stable.toml"
    )
    response.raise_for_status()
    m = re.search(r'\[pkg\.rust\]\nversion = "(\d+\.\d+\.\d+)', response.text)
    assert m is not None
    latest_version = m.group(1)

    logging.log(
        logging.INFO if version == latest_version else logging.WARN,
        "Check {}: {} -> {}".format(package, version, latest_version),
    )
    return version != latest_version


def check_pkgconfig_package(package: str, url: str) -> bool:
    file = os.path.basename(url)
    version = file[len("pkg-config-") : -len(".tar.gz")]

    response = requests.get("https://pkgconfig.freedesktop.org/releases/")
    response.raise_for_status()
    document = html.fromstring(response.content)
    hrefs = document.xpath("//a/@href")

    pattern = re.compile(r"pkg-config-(\d+(?:\.\d+)*)\.tar\.gz$")
    versions = [m.group(1) for href in hrefs if (m := pattern.search(href))]
    versions.sort(key=packaging.version.parse)
    latest_version = versions[-1]

    logging.log(
        logging.INFO if version == latest_version else logging.WARN,
        "Check {}: {} -> {}".format(package, version, latest_version),
    )
    return version != latest_version


def check_perl_package(package: str, url: str) -> bool:
    file = os.path.basename(url)
    version = file[len("perl-") : -len(".tar.gz")]

    response = requests.get("https://www.cpan.org/src/5.0/")
    response.raise_for_status()
    document = html.fromstring(response.content)
    hrefs = document.xpath("//a/@href")

    pattern = re.compile(r"perl-(\d+)\.(\d+)\.(\d+)\.tar\.gz$")
    versions = []
    for href in hrefs:
        m = pattern.search(href)
        if m and int(m.group(2)) % 2 == 0:  # stable: even minor version
            versions.append("{}.{}.{}".format(m.group(1), m.group(2), m.group(3)))
    versions.sort(key=packaging.version.parse)
    latest_version = versions[-1]

    logging.log(
        logging.INFO if version == latest_version else logging.WARN,
        "Check {}: {} -> {}".format(package, version, latest_version),
    )
    return version != latest_version


def check_curl_package(package: str, url: str) -> bool:
    file = os.path.basename(url)
    version = file[len("curl-") : -len(".tar.gz")]

    response = requests.get("https://curl.se/download/")
    response.raise_for_status()
    document = html.fromstring(response.content)
    hrefs = document.xpath("//a/@href")

    pattern = re.compile(r"curl-(\d+(?:\.\d+)*)\.tar\.gz$")
    versions = [m.group(1) for href in hrefs if (m := pattern.search(href))]
    versions.sort(key=packaging.version.parse)
    latest_version = versions[-1]

    logging.log(
        logging.INFO if version == latest_version else logging.WARN,
        "Check {}: {} -> {}".format(package, version, latest_version),
    )
    return version != latest_version


def check_bzip2_package(package: str, url: str) -> bool:
    file = os.path.basename(url)
    version = file[len("bzip2-") : -len(".tar.gz")]

    response = requests.get("https://sourceware.org/pub/bzip2/")
    response.raise_for_status()
    document = html.fromstring(response.content)
    hrefs = document.xpath("//a/@href")

    pattern = re.compile(r"bzip2-(\d+(?:\.\d+)*)\.tar\.gz$")
    versions = [m.group(1) for href in hrefs if (m := pattern.search(href))]
    versions.sort(key=packaging.version.parse)
    latest_version = versions[-1]

    logging.log(
        logging.INFO if version == latest_version else logging.WARN,
        "Check {}: {} -> {}".format(package, version, latest_version),
    )
    return version != latest_version


def check_sqlite_package(package: str, url: str) -> bool:
    file = os.path.basename(url)
    version = file[len("sqlite-autoconf-") : -len(".tar.gz")]

    response = requests.get("https://sqlite.org/download.html")
    response.raise_for_status()

    pattern = re.compile(r"sqlite-autoconf-(\d+)\.tar\.gz")
    versions = list({m.group(1) for m in pattern.finditer(response.text)})
    versions.sort(key=int)
    latest_version = versions[-1]

    logging.log(
        logging.INFO if version == latest_version else logging.WARN,
        "Check {}: {} -> {}".format(package, version, latest_version),
    )
    return version != latest_version


def check_sourceforge_package(package: str, url: str) -> bool:
    # URL: https://downloads.sourceforge.net/project/PROJ/.../VERSION/FILE
    # Version directory is the second-to-last path component
    url_parts = url.rstrip("/").split("/")
    version = url_parts[-2]

    match = re.compile(r"https://downloads\.sourceforge\.net/project/([^/]+)/([^/]+)/").match(
        url
    )
    assert match is not None
    project, subdir = match.group(1), match.group(2)

    # Use RSS feed filtered to the subdir to get the latest release files
    response = requests.get(
        "https://sourceforge.net/projects/{}/rss?path=/{}".format(project, subdir)
    )
    response.raise_for_status()
    # Extract download links from RSS <link> elements via regex
    links = re.findall(r"<link>(https://sourceforge\.net/projects/[^<]+/download)</link>", response.text)
    # Link format: .../files/SUBDIR/VERSION/FILE/download — version is at parts[-3]
    candidates = {lnk.rstrip("/").split("/")[-3] for lnk in links if lnk}
    versions = sorted(candidates, key=lambda v: packaging.version.parse(re.sub(r"^[^0-9]*", "", v)))
    latest_version = versions[-1]

    logging.log(
        logging.INFO if version == latest_version else logging.WARN,
        "Check {}: {} -> {}".format(package, version, latest_version),
    )
    return version != latest_version


def check_libedit_package(package: str, url: str) -> bool:
    file = os.path.basename(url)
    version = file[len("libedit-") : -len(".tar.gz")]

    response = requests.get("https://www.thrysoee.dk/editline/")
    response.raise_for_status()
    document = html.fromstring(response.content)
    hrefs = document.xpath("//a/@href")

    pattern = re.compile(r"libedit-(\d{8}-\d+\.\d+)\.tar\.gz$")
    versions = [m.group(1) for href in hrefs if (m := pattern.search(href))]
    versions.sort()
    latest_version = versions[-1]

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
        elif "static.rust-lang.org" in url:
            if check_rust_package(package, url):
                updates.append(package)
            checked.append(package)
        elif "pkgconfig.freedesktop.org" in url:
            if check_pkgconfig_package(package, url):
                updates.append(package)
            checked.append(package)
        elif "cpan.org" in url:
            if check_perl_package(package, url):
                updates.append(package)
            checked.append(package)
        elif "curl.se" in url:
            if check_curl_package(package, url):
                updates.append(package)
            checked.append(package)
        elif "sourceware.org/pub/bzip2" in url:
            if check_bzip2_package(package, url):
                updates.append(package)
            checked.append(package)
        elif "sqlite.org" in url:
            if check_sqlite_package(package, url):
                updates.append(package)
            checked.append(package)
        elif (
            "sourceforge.net/project/swig" in url
            or "sourceforge.net/project/zsh" in url
        ):
            if check_sourceforge_package(package, url):
                updates.append(package)
            checked.append(package)
        elif "thrysoee.dk" in url:
            if check_libedit_package(package, url):
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
