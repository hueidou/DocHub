#!/bin/sh

docker build -t hueidou/dochub:build-env -f build-env.Dockerfile .
docker build -t hueidou/dochub:env -f env.Dockerfile .
docker build -t dochub .