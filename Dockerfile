FROM alpine:latest as go-nightly-build

RUN apk update && apk add --no-cache git make musl-dev bash go
RUN git clone --recursive https://go.googlesource.com/go

WORKDIR "/go/src"

RUN ./make.bash
RUN /go/bin/go version

FROM alpine:latest

COPY --from=go-nightly-build /go/pkg /usr/local/go/pkg
COPY --from=go-nightly-build /go/bin /usr/local/go/bin

ENV GOROOT /usr/local/go
ENV GOPATH /go

ENV PATH=$GOROOT/bin:$PATH