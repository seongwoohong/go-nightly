FROM alpine:latest as go-nightly-build

RUN apk update && apk add --no-cache git make musl-dev bash go
RUN git clone --recursive https://go.googlesource.com/go

ENV GOROOT_BOOTSTRAP=/usr/lib/go

WORKDIR "/go"

RUN git fetch
RUN git pull

WORKDIR "/go/src"

RUN ./make.bash

WORKDIR "/go"
RUN rm -rf .git

FROM alpine:latest

COPY --from=go-nightly-build /go /usr/local/go

ENV GOROOT /usr/local/go
ENV GOPATH /go

ENV PATH=$GOROOT/bin:$PATH