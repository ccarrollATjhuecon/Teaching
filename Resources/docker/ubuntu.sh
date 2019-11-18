#!/bin/bash

cd /Volumes/Data/GitHub/ccarrollATjhuecon/Teaching/Resources/docker/ubuntu

docker build -t ubuntu . | tee ubuntu.log

