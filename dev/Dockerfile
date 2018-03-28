# Alpine image with bundled Scala plugins
# sonar-scala (https://github.com/mwz/sonar-scala)
# and sonar-scala-extra (https://github.com/arthepsy/sonar-scala-extra),
# which can be mounted as a volume into a SonarQube container.
# This image is intended to be used for local development purposes.

FROM alpine:3.7

ARG SONAR_SCAPEGOAT_VERSION=1.3.0
ARG SONAR_SCALA_VERSION

RUN apk --no-cache add --repository http://dl-cdn.alpinelinux.org/alpine/v3.7/community wget ca-certificates

WORKDIR /opt/sonarqube/extensions/plugins
RUN wget -O "sonar-scapegoat-plugin-${SONAR_SCAPEGOAT_VERSION}.jar" \
    "https://github.com/arthepsy/sonar-scala-extra/releases/download/v${SONAR_SCAPEGOAT_VERSION}/sonar-scapegoat-plugin-${SONAR_SCAPEGOAT_VERSION}.jar"
ADD sonar-scala_2.12-assembly.jar .
