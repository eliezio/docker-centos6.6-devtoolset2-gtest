FROM centos:centos6.6
MAINTAINER Eliezio Oliveira "e.b.o@ieee.org"

WORKDIR /etc/pki/rpm-gpg
ADD assets/RPM-GPG-KEY-puias .
RUN rpm --import RPM-GPG-KEY-puias
COPY puias-*.repo /etc/yum.repos.d/
WORKDIR /

# "yum check-update" yields a non-zero return code even when successful!
RUN yum -q check-update; yum -y install redhat-lsb-core rpm-build cmake unzip patch \
popt-devel zlib-devel glib2-devel \
devtoolset-2-binutils devtoolset-2-gcc devtoolset-2-gcc-c++

# to make DevToolset-2 applications default
COPY devtoolset-2.sh /etc/profile.d/

# missing on popt-devel package
COPY popt.pc /usr/lib64/pkgconfig/

ENV GTEST_VERSION 1.7.0
WORKDIR /usr/local/src
ADD assets/gtest-${GTEST_VERSION}.zip .
RUN unzip -q gtest-${GTEST_VERSION}.zip && rm gtest-${GTEST_VERSION}.zip
WORKDIR /

ENV GTEST_ROOT /usr/local/src/gtest-${GTEST_VERSION}

