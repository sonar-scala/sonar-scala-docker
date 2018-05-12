# Alpine image with bundled Scala plugins
# sonar-scala 6.3.0 (https://github.com/mwz/sonar-scala)
# and sonar-scala-extra 1.3.0 (https://github.com/arthepsy/sonar-scala-extra),
# which can be mounted as a volume into a SonarQube container.

FROM alpine:3.7

ENV SONAR_SCAPEGOAT_VERSION 1.3.0
ENV SONAR_SCALA_VERSION 6.3.0

RUN apk --no-cache add --repository http://dl-cdn.alpinelinux.org/alpine/v3.7/community wget ca-certificates

WORKDIR /opt/sonarqube/extensions/plugins
RUN wget -O "sonar-scapegoat-plugin-${SONAR_SCAPEGOAT_VERSION}.jar" \
    "https://github.com/arthepsy/sonar-scala-extra/releases/download/v${SONAR_SCAPEGOAT_VERSION}/sonar-scapegoat-plugin-${SONAR_SCAPEGOAT_VERSION}.jar"
RUN wget -O "sonar-scala-plugin-${SONAR_SCALA_VERSION}.jar" \
    "https://dl.bintray.com/mwz/maven/com/github/mwz/sonar-scala_2.12/${SONAR_SCALA_VERSION}/sonar-scala_2.12-${SONAR_SCALA_VERSION}-assembly.jar"
