# Minideb image with bundled sonar-scala 7.3.1 (https://github.com/mwz/sonar-scala),
# which can be mounted as a volume into a SonarQube container.

FROM bitnami/minideb:stretch
RUN install_packages curl ca-certificates

ENV SONAR_SCALA_VERSION 7.3.1

RUN groupadd -r sonarqube && useradd -r -g sonarqube sonarqube
WORKDIR /opt/sonarqube/extensions/plugins
RUN curl -L -o "sonar-scala-plugin-${SONAR_SCALA_VERSION}.jar" \
    "https://dl.bintray.com/mwz/maven/com/github/mwz/sonar-scala_2.12/${SONAR_SCALA_VERSION}/sonar-scala_2.12-${SONAR_SCALA_VERSION}-assembly.jar" 
RUN chown -R sonarqube:sonarqube /opt/sonarqube
