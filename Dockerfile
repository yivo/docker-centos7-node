FROM centos:7

RUN yum -y update \
 && yum -y install centos-release-scl \
 && yum -y install which devtoolset-7-make devtoolset-7-gcc devtoolset-7-gcc-c++ \
 && curl -sL https://nodejs.org/dist/v8.9.1/node-v8.9.1.tar.gz | tar xz -C /tmp \
 && cd /tmp/node-v8.9.1 \
 && scl enable devtoolset-7 "./configure" \
 && scl enable devtoolset-7 "make -j $(nproc)" \
 && scl enable devtoolset-7 "make install" \
 && cd / \
 && node -v \
 && npm -v \
 && rm -rf /tmp/node* \
 && yum clean all \
 && rm -rf /var/cache/yum