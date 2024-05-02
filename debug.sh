#!/usr/bin/env bash

docker build -t debuggertron-5000:latest .
docker run --rm -it debuggertron-5000:latest bash
