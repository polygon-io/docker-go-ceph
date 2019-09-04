FROM ceph/daemon-base:master-532cef1-luminous-centos-7

RUN yum install wget git gcc -y && yum clean all

# For some reason, this needs to be seperate yum installs... idk
RUN yum install libcephfs-devel librbd-devel librados-devel -y && yum clean all

RUN wget https://dl.google.com/go/go1.12.7.linux-amd64.tar.gz && \
	tar -xvf go1.12.7.linux-amd64.tar.gz && \
	mv go /usr/local

ENV GOROOT=/usr/local/go
ENV GOPATH=/go/
ENV PATH=$GOPATH/bin:$GOROOT/bin:$PATH

RUN go get github.com/ceph/go-ceph