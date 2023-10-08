#!/bin/bash

cd $(dirname $(realpath $0))
source namespace.conf

if ! sudo `which nerdctl` --namespace=${NAMESPACE} inspect alpine:latest >/dev/null; then
sudo `which nerdctl` --namespace=${NAMESPACE} pull alpine:latest
fi
sudo `which nerdctl` --namespace=${NAMESPACE} tag alpine:latest alpine:nonexisting
sudo `which nerdctl` --namespace=${NAMESPACE} build -t alpine:test test
