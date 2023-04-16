#!/bin/bash

set -eoux pipefail

cd $(dirname $0)/torchserve/

docker build -t docker_torchserve .

docker run -d --name docker_torchserve -p 8080:8080 -p 8081:8081 docker_torchserve

sleep 15 # wait for torchserve to start

curl http://localhost:8080/ping

# should return:
# {
#   "status": "Healthy"
# }
