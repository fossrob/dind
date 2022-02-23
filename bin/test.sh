#!/bin/bash

for ((i=0;i<10;i++)); do
    sleep 1
    if [[ -S /var/run/docker.sock ]]; then
        break
    else
        false
    fi
done
