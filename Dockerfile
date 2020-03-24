FROM golang:alpine as build
ADD . /go/src/github.com/bformet/tailon/
RUN apk add --upgrade git upx binutils
RUN cd /go/src/github.com/bformet/tailon && go get && go build && strip tailon && upx tailon

FROM alpine:3.7
WORKDIR /tailon
COPY --from=build /go/src/github.com/bformet/tailon/tailon /usr/local/bin/tailon

CMD        ["--help"]
ENTRYPOINT ["/usr/local/bin/tailon"]
EXPOSE 8080