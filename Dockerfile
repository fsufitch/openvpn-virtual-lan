FROM golang:latest AS go-build

WORKDIR /gobuild
COPY go.mod go.sum /gobuild/
RUN echo "package main\
        func main() {}" > placeholder.go && \
    go mod download && \
    rm placeholder.go

COPY *.go /gobuild/
RUN go build -v -o openvpn-vlan-util .

FROM ubuntu:latest

VOLUME [ "/app/volume" ]
WORKDIR /app

RUN apt-get update && apt-get install -y openssl openvpn
COPY ca.conf genkeys.sh /app/

CMD [ "sh" ]