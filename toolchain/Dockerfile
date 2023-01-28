FROM ubuntu:22.04 AS builder

RUN apt update && apt upgrade --yes
RUN DEBIAN_FRONTEND=noninteractive apt install --yes \
    build-essential texinfo bison git curl rsync gawk python-is-python3 help2man

RUN mkdir -p /opt/patchelf
RUN curl -L "https://github.com/NixOS/patchelf/releases/download/0.17.0/patchelf-0.17.0-$(uname -m).tar.gz" \
    -o - | tar -zxv -C /opt/patchelf

RUN git clone https://github.com/adonis0147/devel-env
WORKDIR /devel-env/toolchain
ARG TARGET
RUN TARGET="${TARGET}" bash generate_toolchan.sh

RUN cd /opt && mv patchelf/bin/patchelf toolchain/bin && tar -cf - toolchain | xz -T0 -z - >output.tar.xz

FROM ubuntu:latest

COPY --from=builder /opt/output.tar.xz /toolchain/output.tar.xz
COPY ./setup_toolchain.sh /toolchain

WORKDIR /toolchain
RUN cat setup_toolchain.sh output.tar.xz >install_toolchain.sh
RUN chmod a+x install_toolchain.sh

CMD [ \
    "/bin/bash", "-c", \
    "if [[ ! -d /output ]]; then echo \"The host dirve wasn't mounted.\"; else mv install_toolchain.sh /output; fi" \
]
