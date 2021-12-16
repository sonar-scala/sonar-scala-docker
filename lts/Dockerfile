# Minideb image with bundled sonar-scala (https://github.com/mwz/sonar-scala),
# which can be mounted as a volume into a SonarQube container.

FROM bitnami/minideb:stretch
RUN install_packages curl ca-certificates

ENV SONAR_SCALA_VERSION 8.9.0
ENV SQ_EXTENSIONS_DIR "/opt/sonarqube/extensions"

RUN groupadd -g 1000 -r sonarqube && useradd -r -g sonarqube sonarqube
RUN curl --create-dirs -L -o "${SQ_EXTENSIONS_DIR}/plugins/sonar-scala-plugin-${SONAR_SCALA_VERSION}.jar" \
  "https://s01.oss.sonatype.org/content/repositories/releases/com/sonar-scala/sonar-scala_2.13/${SONAR_SCALA_VERSION}/sonar-scala_2.13-${SONAR_SCALA_VERSION}-assembly.jar" && \
  chown -R sonarqube:sonarqube /opt/sonarqube && \
  chmod 777 $SQ_EXTENSIONS_DIR/plugins/*
