FROM centos:centos6.6
MAINTAINER Eliezio Oliveira "eliezio.oliveira@gmail.com"

ENV RPM_GPG_DIR /etc/pki/rpm-gpg
ADD http://puias.princeton.edu/data/puias/6/x86_64/os/RPM-GPG-KEY-puias ${RPM_GPG_DIR}/
RUN rpm --import ${RPM_GPG_DIR}/RPM-GPG-KEY-puias
COPY puias-*.repo /etc/yum.repos.d/

# "yum check-update" yields a non-zero return code even when successful!
RUN yum -q check-update; yum -y install redhat-lsb-core rpm-build cmake unzip patch \
popt-devel zlib-devel glib2-devel \
devtoolset-2-binutils devtoolset-2-gcc devtoolset-2-gcc-c++ \
squid telnet

# to make DevToolset-2 applications default
COPY devtoolset-2.sh /etc/profile.d/

# missing on popt-devel package
COPY popt.pc /usr/lib64/pkgconfig/

ENV GTEST_VERSION 1.7.0
ADD https://googletest.googlecode.com/files/gtest-${GTEST_VERSION}.zip /usr/local/src/
RUN cd /usr/local/src && unzip -q gtest-${GTEST_VERSION}.zip && rm gtest-${GTEST_VERSION}.zip

ENV GTEST_ROOT /usr/local/src/gtest-${GTEST_VERSION}

VOLUME /src
VOLUME /build
VOLUME /dist

WORKDIR /build
