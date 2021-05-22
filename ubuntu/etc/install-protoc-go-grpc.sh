#!/bin/bash
# --------------------------------------------------------------------------------
# Install gRPC et protoc
#
# https://grpc.io/docs/protoc-installation/
# https://grpc.io/docs/languages/go/quickstart/
# --------------------------------------------------------------------------------
# Sat 22 May 2021 07:34:24 PM CEST
# --------------------------------------------------------------------------------
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.1
go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.26
export PATH="$PATH:$(go env GOPATH)/bin"
sudo apt install -y protobuf-compiler
