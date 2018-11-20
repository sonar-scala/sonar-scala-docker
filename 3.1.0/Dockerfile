# Alpine image with bundled sonar-scala 7.1.0 (https://github.com/mwz/sonar-scala),
# which can be mounted as a volume into a SonarQube container.

FROM alpine:3.8

ENV SONAR_SCALA_VERSION 7.1.0

RUN apk --no-cache add --repository http://dl-cdn.alpinelinux.org/alpine/v3.7/community wget ca-certificates

WORKDIR /opt/sonarqube/extensions/plugins
RUN wget -O "sonar-scala-plugin-${SONAR_SCALA_VERSION}.jar" \
    "https://dl.bintray.com/mwz/maven/com/github/mwz/sonar-scala_2.12/${SONAR_SCALA_VERSION}/sonar-scala_2.12-${SONAR_SCALA_VERSION}-assembly.jar"
