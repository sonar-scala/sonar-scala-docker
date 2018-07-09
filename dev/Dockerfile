# Alpine image with bundled sonar-scala plugin (https://github.com/mwz/sonar-scala),
# which can be mounted as a volume into a SonarQube container.
# This image is intended to be used for local development purposes.

FROM alpine:3.7

ARG SONAR_SCALA_VERSION

RUN apk --no-cache add --repository http://dl-cdn.alpinelinux.org/alpine/v3.7/community wget ca-certificates

WORKDIR /opt/sonarqube/extensions/plugins
ADD sonar-scala_2.12-assembly.jar .
