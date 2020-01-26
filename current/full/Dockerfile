# SonarQube 7.8 image with bundled sonar-scala 8.0.0 (https://github.com/mwz/sonar-scala).

FROM sonarqube:8.1-community-beta

ENV SONAR_SCALA_VERSION 8.0.0

WORKDIR /opt/sonarqube/extensions/plugins
RUN rm sonar-scala-plugin-* && wget -O "sonar-scala-plugin-${SONAR_SCALA_VERSION}.jar" \
  "https://dl.bintray.com/mwz/maven/com/github/mwz/sonar-scala_2.13/${SONAR_SCALA_VERSION}/sonar-scala_2.13-${SONAR_SCALA_VERSION}-assembly.jar"

WORKDIR $SONARQUBE_HOME
ENTRYPOINT ["./bin/run.sh"]
