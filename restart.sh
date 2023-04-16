#!/bin/bash

set -eoux pipefail

cd $(dirname $0)/torchserve/

docker restart docker_torchserve

sleep 15 # wait for torchserve to start

curl http://localhost:8080/ping

# should return:
# {
#   "status": "Healthy"
# }
