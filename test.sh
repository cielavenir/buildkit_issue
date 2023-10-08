#!/bin/bash

cd $(dirname $(realpath $0))
source namespace.conf

if ! sudo `which nerdctl` --namespace=${NAMESPACE} inspect alpine:latest >/dev/null; then
sudo `which nerdctl` --namespace=${NAMESPACE} pull alpine:latest
fi
sudo `which nerdctl` --namespace=${NAMESPACE} build -t alpine:nonexisting1 test1
sudo `which nerdctl` --namespace=${NAMESPACE} build -t alpine:nonexisting2 test2
