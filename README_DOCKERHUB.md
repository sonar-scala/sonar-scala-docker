Docker images with out-of-the-box
[SonarQube 6.7 LTS](https://www.sonarqube.org/sonarqube-6-7-lts),
[SonarQube 7.9 LTS](https://www.sonarqube.org/sonarqube-7-9-lts) and
[SonarQube 8.3.1](https://www.sonarqube.org) instance with support
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

- `5.3.0`, `latest`
  [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/5.3.0/Dockerfile),
  `5.3.0-full`, `latest-full`
  [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/5.3.0-full/Dockerfile),
  [Release 5.3.0](https://github.com/mwz/sonar-scala-docker/releases/tag/5.3.0)
- `4.2.0`, `latest-lts` (7.9 LTS)
  [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/4.2.0/Dockerfile),
  `4.2.0-full`, `latest-lts-full` (7.9 LTS)
  [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/4.2.0-full/Dockerfile),
  [Release 4.2.0](https://github.com/mwz/sonar-scala-docker/releases/tag/4.2.0)
- `2.12.0` (6.7 LTS)
  [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.12.0/Dockerfile),
  `2.12.0-full` (6.7 LTS)
  [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.12.0-full/Dockerfile),
  [Release 2.12.0](https://github.com/mwz/sonar-scala-docker/releases/tag/2.12.0)

For older versions please check the
[releases](https://github.com/mwz/sonar-scala-docker/releases) page on Github.

## What's included

| Version                  | SonarQube         | sonar-scala            |
| ------------------------ | ----------------- | ---------------------- |
| 5.3.0      |                   | 8.3.0 |
| 5.3.0-full | 8.3.1 | 8.3.0 |
| 4.2.0          |                   | 7.9.0     |
| 4.2.0-full     | 7.9.1 LTS     | 7.9.0     |
| 2.12.0        |                   | 6.8.0   |
| 2.12.0-full   | 6.7.7 LTS   | 6.8.0   |

## Usage

To use one of the volume images, mount it as a volume to your existing SonarQube
container using e.g. `docker-compose`:

```
version: "2"

services:
  sonarqube:
    image: sonarqube:8.3.1-community
    ports:
      - "80:9000"
    networks:
      - sonarnet
    volumes_from:
      - plugins

  plugins:
    image: mwizner/sonarqube-scala-plugins:5.3.0
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
  mwizner/sonarqube-scala-plugins:5.3.0-full
```

Please note that if you don't specify the `SONARQUBE_JDBC_URL` variable,
SonarQube will use an embedded H2 database, which is not recommended in
production, but if you don't have access to an existing database or you just
want to try the image, you can use the following command:

```bash
docker run -d \
  --name sonarqube-scala-plugins-full \
  -p 80:9000 \
  mwizner/sonarqube-scala-plugins:5.3.0-full
```

## Repository

This project is open-sourced and can be found on
[Github](https://github.com/mwz/sonar-scala-docker).

sonar-scala documentation can be found on
[sonar-scala.com](https://sonar-scala.com).
