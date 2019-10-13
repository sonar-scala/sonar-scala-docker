#!/usr/bin/env bash
set -eu

# Build
docker build -t mwizner/sonarqube-scala-plugins:$VERSION -t mwizner/sonarqube-scala-plugins:latest current
docker build -t mwizner/sonarqube-scala-plugins:$VERSION-full current/full

# Push
docker push mwizner/sonarqube-scala-plugins:$VERSION
docker push mwizner/sonarqube-scala-plugins:$VERSION-full
docker push mwizner/sonarqube-scala-plugins:latest
