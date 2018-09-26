FROM golang:latest

RUN go get -u github.com/astaxie/beego
RUN go get -u github.com/beego/bee