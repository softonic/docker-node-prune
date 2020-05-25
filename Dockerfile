FROM golang:alpine

RUN apk add --no-cache git &&\
    go get -d -v github.com/tj/node-prune

WORKDIR /app

ENTRYPOINT ["node-prune"]
