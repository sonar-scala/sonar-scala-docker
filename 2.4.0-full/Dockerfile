# SonarQube 6.7.3 LTS image with bundled Scala plugins
# sonar-scala 6.3.0 (https://github.com/mwz/sonar-scala)
# and sonar-scala-extra 1.3.0 (https://github.com/arthepsy/sonar-scala-extra).

FROM sonarqube:6.7.3-alpine

ENV SONAR_SCAPEGOAT_VERSION 1.3.0
ENV SONAR_SCALA_VERSION 6.3.0

WORKDIR /opt/sonarqube/extensions/plugins
RUN wget -O "sonar-scapegoat-plugin-${SONAR_SCAPEGOAT_VERSION}.jar" \
    "https://github.com/arthepsy/sonar-scala-extra/releases/download/v${SONAR_SCAPEGOAT_VERSION}/sonar-scapegoat-plugin-${SONAR_SCAPEGOAT_VERSION}.jar"
RUN wget -O "sonar-scala-plugin-${SONAR_SCALA_VERSION}.jar" \
    "https://dl.bintray.com/mwz/maven/com/github/mwz/sonar-scala_2.12/${SONAR_SCALA_VERSION}/sonar-scala_2.12-${SONAR_SCALA_VERSION}-assembly.jar"

WORKDIR $SONARQUBE_HOME
ENTRYPOINT ["./bin/run.sh"]
