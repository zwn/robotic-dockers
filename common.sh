#!/bin/sh

USER=$(docker info 2>&1 | grep -e '^ Username: ' | sed -e 's/ Username: \(.*\)/\1/')
IMAGE=${USER}/$(basename $DIR)

