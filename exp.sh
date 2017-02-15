#!/bin/sh
docker run \
       --rm \
       -ti \
       --privileged \
       -v /dev/bus/usb:/dev/bus/usb \
       -v $(pwd):/root/app \
       -v "~/.exponent":/root/.exponent \
       exp-cli \
       exp "$@"
