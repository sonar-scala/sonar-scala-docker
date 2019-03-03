#!/usr/bin/env bash
set -eu

# Build
docker build -t mwizner/sonarqube-scala-plugins:$VERSION $VERSION
docker build -t mwizner/sonarqube-scala-plugins:$VERSION-full $VERSION-full

# Push
docker push mwizner/sonarqube-scala-plugins:$VERSION
docker push mwizner/sonarqube-scala-plugins:$VERSION-full
