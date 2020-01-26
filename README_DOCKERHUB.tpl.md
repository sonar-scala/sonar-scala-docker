Docker images with out-of-the-box
[SonarQube 6.7 LTS](https://www.sonarqube.org/sonarqube-6-7-lts),
[SonarQube 7.9 LTS](https://www.sonarqube.org/sonarqube-7-9-lts) and
[SonarQube 8.1](https://www.sonarqube.org/sonarqube-8-1) instance with support
for **[Scala](http://www.scala-lang.org)**,
**[Scoverage](https://github.com/scoverage/scalac-scoverage-plugin)** (code
coverage metrics) and **[Scalastyle](http://www.scalastyle.org)** +
**[Scapegoat](https://github.com/sksamuel/scapegoat)** (static code analysis).

## Available versions

There are two types of images available: images with
[sonar-scala](https://github.com/mwz/sonar-scala) plugin, which can be mounted
as a volume into a SonarQube container and images which bundle sonar-scala
plugin with SonarQube server (suffixed with `-full`).

Starting from version `2.7.0`, the images no longer contain the
[sonar-scala-extra](https://github.com/arthepsy/sonar-scala-extra) plugin as
sonar-scala provides Scapegoat support from version `6.5.0` onwards.

- `{{current.version}}`, `latest`
  [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/{{current.version}}/Dockerfile),
  `{{current.version}}-full`, `latest-full`
  [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/{{current.version}}-full/Dockerfile),
  [Release {{current.version}}](https://github.com/mwz/sonar-scala-docker/releases/tag/{{current.version}})
- `{{lts.version}}`, `latest-lts` (7.9 LTS)
  [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/{{lts.version}}/Dockerfile),
  `{{lts.version}}-full`, `latest-lts-full` (7.9 LTS)
  [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/{{lts.version}}-full/Dockerfile),
  [Release {{lts.version}}](https://github.com/mwz/sonar-scala-docker/releases/tag/{{lts.version}})
- `{{lts67.version}}` (6.7 LTS)
  [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/{{lts67.version}}/Dockerfile),
  `{{lts67.version}}-full` (6.7 LTS)
  [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/{{lts67.version}}-full/Dockerfile),
  [Release {{lts67.version}}](https://github.com/mwz/sonar-scala-docker/releases/tag/{{lts67.version}})

For older versions please check the
[releases](https://github.com/mwz/sonar-scala-docker/releases) page on Github.

## What's included

| Version                  | SonarQube         | sonar-scala            |
| ------------------------ | ----------------- | ---------------------- |
| {{current.version}}      |                   | {{current.sonarScala}} |
| {{current.version}}-full | {{current.sonar}} | {{current.sonarScala}} |
| {{lts.version}}          |                   | {{lts.sonarScala}}     |
| {{lts.version}}-full     | {{lts.sonar}}     | {{lts.sonarScala}}     |
| {{lts67.version}}        |                   | {{lts67.sonarScala}}   |
| {{lts67.version}}-full   | {{lts67.sonar}}   | {{lts67.sonarScala}}   |

## Usage

To use one of the volume images, mount it as a volume to your existing SonarQube
container using e.g. `docker-compose`:

```
version: "2"

services:
  sonarqube:
    image: sonarqube:{{current.sonar}}-community-beta
    ports:
      - "80:9000"
    networks:
      - sonarnet
    volumes_from:
      - plugins

  plugins:
    image: mwizner/sonarqube-scala-plugins:{{current.version}}
    volumes:
      - sonarqube_plugins:/opt/sonarqube/extensions/plugins
    command: /bin/true

networks:
  sonarnet:
    driver: bridge

volumes:
  sonarqube_plugins:
```

You can find the full recipe
[here](https://github.com/mwz/sonar-scala-docker/blob/master/docker-compose.yml)
and
[here](https://github.com/mwz/sonar-scala-docker/blob/master/docker-compose-lts.yml)
(for the LTS version).

To use the `full` image, run the following `docker` command:

```bash
docker run -d \
  --name sonarqube-scala-plugins-full \
  -p 80:9000 \
  -e SONARQUBE_JDBC_USERNAME=sonar \
  -e SONARQUBE_JDBC_PASSWORD=sonar \
  -e SONARQUBE_JDBC_URL=jdbc:postgresql://localhost/sonar \
  mwizner/sonarqube-scala-plugins:{{current.version}}-full
```

Please note that if you don't specify the `SONARQUBE_JDBC_URL` variable,
SonarQube will use an embedded H2 database, which is not recommended in
production, but if you don't have access to an existing database or you just
want to try the image, you can use the following command:

```bash
docker run -d \
  --name sonarqube-scala-plugins-full \
  -p 80:9000 \
  mwizner/sonarqube-scala-plugins:{{current.version}}-full
```

## Repository

This project is open-sourced and can be found on
[Github](https://github.com/mwz/sonar-scala-docker).
