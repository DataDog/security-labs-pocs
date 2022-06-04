#!/bin/bash
docker exec -t -i `docker ps | grep "$1" | cut -d " " -f 1` bash
