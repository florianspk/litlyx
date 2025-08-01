#!/usr/bin/env bash

# Clone and build:
if [ ! -d "readme-generator-for-helm" ]; then
    git clone https://github.com/bitnami-labs/readme-generator-for-helm
fi
docker build -t readme-gen readme-generator-for-helm/

# Run the tool and mount the current project directory.
docker run --rm --privileged -v $(pwd):/mnt -w /mnt readme-gen readme-generator -v charts/litlyx/values.yaml -r charts/litlyx/README.md
