FROM golang:1.11-stretch

RUN mkdir -p /go/src/github.com/ryanhartje/locker/ && \
    apt update && apt install git && \
    go get -u github.com/golang/dep/cmd/dep

COPY . /go/src/github.com/ryanhartje/locker/

RUN cd /go/src/github.com/ryanhartje/locker && \
    dep ensure -vendor-only

WORKDIR /go/src/github.com/ryanhartje/locker/cmd/locker

ENTRYPOINT [ "go", "test" ]