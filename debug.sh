#!/bin/sh
docker exec -it $(docker ps | grep voyant-docker | cut -d ' ' -f 1) bash

