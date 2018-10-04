#!/bin/sh

# Build and run the dockerized TAF
docker build --pull --rm -t stage1-taf .
docker run --name stage2-taf -d stage1-taf

# Copy the result archive
rm -fr ./results/*
docker cp stage2-taf:/projects/results.tar.gz ./results/

# Cleaning up
docker stop stage2-taf
docker container rm stage2-taf

# Extract the results
tar -zxvf ./results/results.tar.gz -C ./results/

