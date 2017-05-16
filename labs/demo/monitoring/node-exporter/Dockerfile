FROM alpine:latest

ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin

RUN apk --update add make go bzr git mercurial subversion openssh-client ca-certificates \
    && mkdir /usr/lib/go/bin \
    && cp /usr/bin/go /usr/lib/go/bin/go \
    && mkdir -p /go/src /go/bin && chmod -R 777 /go \
    && mkdir -p /go/src/github.com/prometheus \
    && cd /go/src/github.com/prometheus \
    && git clone https://github.com/prometheus/node_exporter.git \
    && cd /go/src/github.com/prometheus/node_exporter \
    && make \
    && cp node_exporter /usr/local/bin/ \
    && make clean \
    && apk del --purge make go bzr git mercurial subversion openssh-client ca-certificates \
    && rm -rf /go /var/cache/apk/*

EXPOSE 9100

CMD ["/usr/local/bin/node_exporter"]
