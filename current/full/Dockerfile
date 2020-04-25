# SonarQube 8.2 image with bundled sonar-scala (https://github.com/mwz/sonar-scala).

FROM sonarqube:8.2-community

ENV SONAR_SCALA_VERSION 8.2.0

WORKDIR /opt/sonarqube/extensions/plugins
RUN rm sonar-scala-plugin-* && curl -L -o "sonar-scala-plugin-${SONAR_SCALA_VERSION}.jar" \
  "https://dl.bintray.com/mwz/maven/com/github/mwz/sonar-scala_2.13/${SONAR_SCALA_VERSION}/sonar-scala_2.13-${SONAR_SCALA_VERSION}-assembly.jar"

WORKDIR $SONARQUBE_HOME
ENTRYPOINT ["./bin/run.sh"]
