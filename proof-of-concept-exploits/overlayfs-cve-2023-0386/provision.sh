#!/bin/bash

# Pre-requisites
sudo apt update
sudo apt-get install -y make gcc libfuse-dev


# Underprivileged user
sudo useradd john --create-home --shell /bin/bash
