FROM alpine:3.4

RUN apk --no-cache add --repository http://dl-cdn.alpinelinux.org/alpine/3.4/community wget ca-certificates

WORKDIR /tmp/sonarqube/plugins
RUN wget https://github.com/Sagacify/sonar-scala/releases/download/v0.0.3/sonar-scala-plugin-0.0.3.jar
RUN wget https://github.com/arthepsy/sonar-scala-extra/releases/download/v1.3.0/sonar-scapegoat-plugin-1.3.0.jar
VOLUME /opt/sonarqube

CMD cp -R /tmp/sonarqube/plugins/* /opt/sonarqube/extensions/plugins
