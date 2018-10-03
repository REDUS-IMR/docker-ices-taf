#!/bin/sh

USER=$(id -u)
GROUP=$(id -u)

sudo chown -R $USER:$GROUP ./results

