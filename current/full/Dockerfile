# SonarQube 8.5 image with bundled sonar-scala (https://github.com/mwz/sonar-scala).

FROM sonarqube:8.5.1-community

ENV SONAR_SCALA_VERSION 8.6.0

RUN rm $SONARQUBE_HOME/lib/extensions/sonar-scala* && \
  wget -O "${SQ_EXTENSIONS_DIR}/plugins/sonar-scala-plugin-${SONAR_SCALA_VERSION}.jar" \
  "https://dl.bintray.com/mwz/maven/com/github/mwz/sonar-scala_2.13/${SONAR_SCALA_VERSION}/sonar-scala_2.13-${SONAR_SCALA_VERSION}-assembly.jar" && \
  chown sonarqube:sonarqube $SQ_EXTENSIONS_DIR/plugins/sonar-scala-plugin-* && \
  chmod 777 $SQ_EXTENSIONS_DIR/plugins/sonar-scala-plugin-*

WORKDIR $SONARQUBE_HOME
ENTRYPOINT ["./bin/run.sh"]
