#!/usr/bin/env bash
set -eu

# Build
docker build \
  -t mwizner/sonarqube-scala-plugins:$VERSION \
  -t mwizner/sonarqube-scala-plugins:latest-lts \
  lts
docker build \
  -t mwizner/sonarqube-scala-plugins:$VERSION-full \
  -t mwizner/sonarqube-scala-plugins:latest-lts-full \
  lts/full

# Push
docker push mwizner/sonarqube-scala-plugins:$VERSION
docker push mwizner/sonarqube-scala-plugins:latest-lts
docker push mwizner/sonarqube-scala-plugins:$VERSION-full
docker push mwizner/sonarqube-scala-plugins:latest-lts-full
