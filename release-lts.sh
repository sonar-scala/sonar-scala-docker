#!/usr/bin/env bash
set -eu

# Build
docker build -t mwizner/sonarqube-scala-plugins:$VERSION lts
docker build -t mwizner/sonarqube-scala-plugins:$VERSION-full lts/full

# Push
docker push mwizner/sonarqube-scala-plugins:$VERSION
docker push mwizner/sonarqube-scala-plugins:$VERSION-full
