FROM ceph/daemon-base:latest-nautilus-devel

RUN yum install wget git gcc -y && yum clean all

# For some reason, this needs to be seperate yum installs... idk
RUN yum install libcephfs-devel librbd-devel librados-devel -y && yum clean all

ARG GOVERSION=1.14.3

RUN wget https://dl.google.com/go/go$GOVERSION.linux-amd64.tar.gz && \
	tar -xvf go$GOVERSION.linux-amd64.tar.gz && \
	mv go /usr/local

ENV GOROOT=/usr/local/go
ENV GOPATH=/go/
ENV PATH=$GOPATH/bin:$GOROOT/bin:$PATH

RUN go get github.com/ceph/go-ceph
