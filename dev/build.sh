#!/usr/bin/env bash
set -eu

export SONAR_SCALA_VERSION=8.9.0+5-1ab816ae-SNAPSHOT
cp ~/.ivy2/local/com.sonar-scala/sonar-scala_2.13/${SONAR_SCALA_VERSION}/jars/sonar-scala_2.13-assembly.jar .
docker build -t mwizner/sonarqube-scala-plugins:dev --build-arg SONAR_SCALA_VERSION=${SONAR_SCALA_VERSION} .
