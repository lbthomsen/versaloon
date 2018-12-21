#!/bin/bash
set -e
PROJECT="versaloon"
docker build -t $PROJECT .
docker run -v $PWD/bin:/mnt $PROJECT bash -c "sudo cp -v /home/versaloon/code/*.bin /mnt"
