#!/bin/bash

cd $(dirname $(realpath $0))
source namespace.conf

sudo /usr/bin/buildkitd --containerd-worker=true --oci-worker=false --containerd-worker-namespace=${BUILDKIT_NAMESPACE}
