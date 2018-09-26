FROM hueidou/dochub:build-env as build-env

WORKDIR /go/src/github.com/TruthHun/DocHub

RUN go get github.com/TruthHun/gotil

COPY . .

RUN go build -o dochub main.go

#
FROM hueidou/dochub:env

WORKDIR /app

COPY --from=build-env /go/src/github.com/TruthHun/DocHub/conf ./conf
COPY --from=build-env /go/src/github.com/TruthHun/DocHub/dictionary ./dictionary
COPY --from=build-env /go/src/github.com/TruthHun/DocHub/static ./static
COPY --from=build-env /go/src/github.com/TruthHun/DocHub/views ./views
COPY --from=build-env /go/src/github.com/TruthHun/DocHub/dochub .

EXPOSE 8090

CMD ["/app/dochub"]