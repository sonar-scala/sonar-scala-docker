# Minideb image with bundled sonar-scala (https://github.com/mwz/sonar-scala),
# which can be mounted as a volume into a SonarQube container.

FROM bitnami/minideb:stretch
RUN install_packages curl ca-certificates

ENV SONAR_SCALA_VERSION 8.3.0
ENV GIT_PLUGIN_VERSION 1.11.1.2008
ENV SQ_EXTENSIONS_DIR "/opt/sonarqube/extensions"

RUN groupadd -g 1000 -r sonarqube && useradd -r -g sonarqube sonarqube
RUN curl --create-dirs -L -o "${SQ_EXTENSIONS_DIR}/plugins/sonar-scala-plugin-${SONAR_SCALA_VERSION}.jar" \
  "https://dl.bintray.com/mwz/maven/com/github/mwz/sonar-scala_2.13/${SONAR_SCALA_VERSION}/sonar-scala_2.13-${SONAR_SCALA_VERSION}-assembly.jar" && \
  curl --create-dirs -L -o "${SQ_EXTENSIONS_DIR}/plugins/sonar-scm-git-plugin-${GIT_PLUGIN_VERSION}.jar" \
  "https://repo1.maven.org/maven2/org/sonarsource/scm/git/sonar-scm-git-plugin/${GIT_PLUGIN_VERSION}/sonar-scm-git-plugin-${GIT_PLUGIN_VERSION}.jar" && \
  chown -R sonarqube:sonarqube /opt/sonarqube && \
  chmod 777 $SQ_EXTENSIONS_DIR/plugins/*
