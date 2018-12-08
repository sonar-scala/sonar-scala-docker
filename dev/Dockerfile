# Minideb image with bundled sonar-scala plugin (https://github.com/mwz/sonar-scala),
# which can be mounted as a volume into a SonarQube container.
# This image is intended to be used for local development purposes.

FROM bitnami/minideb:stretch

ARG SONAR_SCALA_VERSION

RUN groupadd -r sonarqube && useradd -r -g sonarqube sonarqube
ADD --chown=sonarqube:sonarqube sonar-scala_2.12-assembly.jar /opt/sonarqube/extensions/plugins/sonar-scala_2.12-assembly.jar
WORKDIR /opt/sonarqube/extensions/plugins
