#!/bin/bash

COUNT=1 TRIES=5

until [[ -S /var/run/docker.sock ]]; do

    if [[ $COUNT -le $TRIES ]]; then
        sleep 1
    else
        exit 1
    fi

    ((COUNT++))

done
