#!/usr/bin/env bash
set -eu

export VERSION=2.4.0

# Build
docker build -t mwizner/sonarqube-scala-plugins:$VERSION -t mwizner/sonarqube-scala-plugins:latest $VERSION
docker build -t mwizner/sonarqube-scala-plugins:$VERSION-full $VERSION-full

# Push
docker push mwizner/sonarqube-scala-plugins:$VERSION
docker push mwizner/sonarqube-scala-plugins:$VERSION-full
docker push mwizner/sonarqube-scala-plugins:latest
