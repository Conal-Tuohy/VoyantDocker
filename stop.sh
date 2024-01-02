#!/bin/sh
docker stop $(docker ps | grep voyant-docker | cut -d ' ' -f 1)

