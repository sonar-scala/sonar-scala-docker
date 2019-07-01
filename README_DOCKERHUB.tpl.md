Docker images with out-of-the-box
[SonarQube 6.7 LTS](https://www.sonarqube.org/sonarqube-6-7-lts) and
[SonarQube 7.8](https://www.sonarqube.org/sonarqube-7-8) instance with support
for [Scala](http://www.scala-lang.org),
[Scoverage](https://github.com/scoverage/scalac-scoverage-plugin) (code coverage
metrics) and [Scalastyle](http://www.scalastyle.org) +
[Scapegoat](https://github.com/sksamuel/scapegoat) (static code analysis).

## Available versions

There are two types of images available: images with
[sonar-scala](https://github.com/mwz/sonar-scala) plugin, which can be mounted
as a volume into a SonarQube container and images which bundle sonar-scala
plugin with SonarQube server (suffixed with `-full`).

Starting from version `2.7.0`, the images no longer contain the
[sonar-scala-extra](https://github.com/arthepsy/sonar-scala-extra) plugin as
sonar-scala provides Scapegoat support from version `6.5.0` onwards.

#### Current

- `{{current.version}}` (latest)
  [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/{{current.version}}/Dockerfile),
  `{{current.version}}-full`
  [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/{{current.version}}-full/Dockerfile),
  [Release {{current.version}}](https://github.com/mwz/sonar-scala-docker/releases/tag/{{current.version}})
- `{{lts.version}}` (LTS)
  [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/{{lts.version}}/Dockerfile),
  `{{lts.version}}-full` (LTS)
  [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/{{lts.version}}-full/Dockerfile),
  [Release {{lts.version}}](https://github.com/mwz/sonar-scala-docker/releases/tag/{{lts.version}})

#### Older

{{#versions.current}}

- `{{version}}`
  [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/{{version}}/Dockerfile),
  `{{version}}-full`
  [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/{{version}}-full/Dockerfile),
  [Release {{version}}](https://github.com/mwz/sonar-scala-docker/releases/tag/{{version}})
  {{/versions.current}} {{#versions.lts}}
- `{{version}}` (LTS)
  [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/{{version}}/Dockerfile),
  `{{version}}-full` (LTS)
  [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/{{version}}-full/Dockerfile),
  [Release {{version}}](https://github.com/mwz/sonar-scala-docker/releases/tag/{{version}})
  {{/versions.lts}}

## What's included

<!-- prettier-ignore-start -->
Version | SonarQube | sonar-scala | sonar-scala-extra
--------|-----------|-------------|------------------
{{current.version}} || {{current.sonarScala}}
{{current.version}}-full | {{current.sonar}} | {{current.sonarScala}}
{{#versions.current}}
{{version}} || {{sonarScala}}
{{version}}-full | {{sonar}} | {{sonarScala}}
{{/versions.current}}
{{lts.version}} || {{lts.sonarScala}} | {{sonarScalaExtra}}
{{lts.version}}-full | {{lts.sonar}} | {{lts.sonarScala}} | {{sonarScalaExtra}}
{{#versions.lts}}
{{version}} || {{sonarScala}} | {{sonarScalaExtra}}
{{version}}-full | {{sonar}} | {{sonarScala}} | {{sonarScalaExtra}}
{{/versions.lts}}
<!-- prettier-ignore-end -->

## Usage

To use one of the volume images, mount it as a volume to your existing SonarQube
container using e.g. `docker-compose`:

```
version: "2"

services:
  sonarqube:
    image: sonarqube:{{current.sonar}}-community
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
