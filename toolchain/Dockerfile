FROM centos:centos7 AS builder

RUN curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo
RUN yum -y update && yum -y upgrade
RUN yum install -y which git python3 autoconf automake libtool gcc gcc-c++ make \
    flex byacc bison texinfo bzip2 unzip help2man file patch ncurses-devel

RUN git clone https://github.com/crosstool-ng/crosstool-ng && \
    cd crosstool-ng && git checkout crosstool-ng-1.25.0 -b crosstool-ng-1.25.0
RUN cd crosstool-ng && ./bootstrap && ./configure --prefix=/opt/crosstool-ng && make -j "$(nproc)" && make install
RUN rm -rf crosstool-ng

RUN useradd -m toolchain 
USER toolchain

RUN mkdir -p /home/toolchain/toolchain
COPY ./samples /home/toolchain/toolchain/samples
WORKDIR /home/toolchain/toolchain
RUN /opt/crosstool-ng/bin/ct-ng x86_64-pc-linux-gnu && CT_DEBUG_CT_SAVE_STEPS=Y /opt/crosstool-ng/bin/ct-ng build


FROM centos:centos7 AS toolchain

RUN curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo
RUN yum -y update && yum -y upgrade
RUN yum install -y make

COPY --from=builder /opt/crosstool-ng  /opt/crosstool-ng
COPY --from=builder /home/toolchain/x-tools  /x-tools
COPY ./generate_toolchan.sh /x-tools
COPY ./setup_toolchain.sh /x-tools

WORKDIR /x-tools

RUN curl -L https://github.com/NixOS/patchelf/releases/download/0.14.5/patchelf-0.14.5-x86_64.tar.gz \
    -o patchelf.tar.gz

CMD ["/x-tools/generate_toolchan.sh"]
