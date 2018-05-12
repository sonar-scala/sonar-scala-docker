Docker images with out-of-the-box [SonarQube LTS](https://www.sonarqube.org) instance with support for [Scala](http://www.scala-lang.org), [Scoverage](https://github.com/scoverage/scalac-scoverage-plugin) (code coverage metrics) and [Scalastyle](http://www.scalastyle.org) + [Scapegoat](https://github.com/sksamuel/scapegoat) (static code analysis).

## Available versions

There are two types of images available: images with [sonar-scala](https://github.com/mwz/sonar-scala) and [sonar-scala-extra](https://github.com/arthepsy/sonar-scala-extra) plugins, which can be mounted as a volume into a SonarQube container and images which bundle those plugins with SonarQube (suffixed with `-full`). 

- `2.4.0`, `latest` [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.4.0/Dockerfile), [(v2.4.0)](https://github.com/mwz/sonar-scala-docker/releases/tag/2.4.0)
- `2.4.0-full` [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.4.0-full/Dockerfile), [(v2.4.0)](https://github.com/mwz/sonar-scala-docker/releases/tag/2.4.0)
- `2.3.0`, `latest` [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.3.0/Dockerfile), [(v2.3.0)](https://github.com/mwz/sonar-scala-docker/releases/tag/2.3.0)
- `2.3.0-full` [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.3.0-full/Dockerfile), [(v2.3.0)](https://github.com/mwz/sonar-scala-docker/releases/tag/2.3.0)
- `2.2.1`, [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.2.1/Dockerfile), [(v2.2.1)](https://github.com/mwz/sonar-scala-docker/releases/tag/2.2.1)
- `2.2.1-full` [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.2.1-full/Dockerfile), [(v2.2.1)](https://github.com/mwz/sonar-scala-docker/releases/tag/2.2.1)
- `2.2.0` [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.2.0/Dockerfile), [(v2.2.0)](https://github.com/mwz/sonar-scala-docker/releases/tag/2.2.0)
- `2.2.0-full` [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.2.0-full/Dockerfile), [(v2.2.0)](https://github.com/mwz/sonar-scala-docker/releases/tag/2.2.0)
- `2.1.0` [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.1.0/Dockerfile), [(v2.1.0)](https://github.com/mwz/sonar-scala-docker/releases/tag/2.1.0)
- `2.1.0-full` ([Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.1.0-full/Dockerfile)), [(v2.1.0)](https://github.com/mwz/sonar-scala-docker/releases/tag/2.1.0)

## What's included
Version | SonarQube | sonar-scala | sonar-scala-extra
--------|-----------|-------------|------------------
2.4.0 | | 6.3.0 | 1.3.0
2.4.0-full | 6.7.3 LTS | 6.3.0 | 1.3.0
2.3.0 | | 6.2.0 | 1.3.0
2.3.0-full | 6.7.3 LTS | 6.2.0 | 1.3.0
2.2.1 | | 6.1.0 | 1.3.0
2.2.1-full | 6.7.3 LTS | 6.1.0 | 1.3.0
2.2.0 | | 6.1.0 | 1.3.0
2.2.0-full | 6.7.2 LTS | 6.1.0 | 1.3.0
2.1.0 | | 6.0.0 | 1.3.0
2.1.0-full | 6.7.1 LTS | 6.0.0 | 1.3.0


## Usage
To use one of the volume images, mount it as a volume to your existing SonarQube container using e.g. `docker-compose`:
```
version: "2"

services:
  sonarqube:
    image: sonarqube:6.7.3-alpine # lts
    ports:
      - "80:9000"
    networks:
      - sonarnet
    volumes_from:
      - plugins

  plugins:
    image: mwizner/sonarqube-scala-plugins:2.4.0
    volumes:
      - sonarqube_plugins:/opt/sonarqube/extensions/plugins
    command: /bin/true

networks:
  sonarnet:
    driver: bridge

volumes:
  sonarqube_plugins:
```

You can get the full recipe from [here](https://github.com/mwz/sonar-scala-docker/blob/master/docker-compose.yml).

To use the `full` image, run the following `docker` command:
```bash
docker run -d --name sonarqube-scala-plugins-full \
  -p 80:9000 \
  -e SONARQUBE_JDBC_USERNAME=sonar \
  -e SONARQUBE_JDBC_PASSWORD=sonar \
  -e SONARQUBE_JDBC_URL=jdbc:postgresql://localhost/sonar \
  mwizner/sonarqube-scala-plugins:2.4.0-full
```

Please note that if you don't specify the `SONARQUBE_JDBC_URL` variable, SonarQube will use an embedded H2 database, which is not recommended in production.

## Repository
This project is open-sourced and can be found on [Github](https://github.com/mwz/sonar-scala-docker).
