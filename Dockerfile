FROM centos:centos6.6
MAINTAINER Eliezio Oliveira "eliezio.oliveira@gmail.com"

ENV RPM_GPG_DIR /etc/pki/rpm-gpg
ADD http://puias.princeton.edu/data/puias/6/x86_64/os/RPM-GPG-KEY-puias ${RPM_GPG_DIR}/
RUN rpm --import ${RPM_GPG_DIR}/RPM-GPG-KEY-puias
COPY puias-*.repo /etc/yum.repos.d/

RUN yum -y check-update; yum install -y epel-release && yum -y install redhat-lsb-core rpm-build cmake unzip patch \
popt-devel zlib-devel glib2-devel libsodium-devel \
devtoolset-2-binutils devtoolset-2-gcc devtoolset-2-gcc-c++ \
golang \
&& rm -f /etc/localtime && ln -sfn /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

# to make DevToolset-2 applications default
COPY devtoolset-2.sh /etc/profile.d/

# missing on popt-devel package
COPY popt.pc /usr/lib64/pkgconfig/

ENV GTEST_VERSION 1.8.0
ADD https://github.com/google/googletest/archive/release-${GTEST_VERSION}.zip /usr/local/src/
RUN cd /usr/local/src && unzip -q release-${GTEST_VERSION}.zip && rm release-${GTEST_VERSION}.zip

ENV GTEST_ROOT /usr/local/src/googletest-release-${GTEST_VERSION}

ENV TINI_VERSION v0.14.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

VOLUME /src
VOLUME /build
VOLUME /dist

WORKDIR /build
