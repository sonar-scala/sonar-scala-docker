Docker images with out-of-the-box [SonarQube 6.7 LTS](https://www.sonarqube.org/sonarqube-6-7-lts) and [SonarQube 7.6](https://www.sonarqube.org/sonarqube-7-6) instance with support for [Scala](http://www.scala-lang.org), [Scoverage](https://github.com/scoverage/scalac-scoverage-plugin) (code coverage metrics) and [Scalastyle](http://www.scalastyle.org) + [Scapegoat](https://github.com/sksamuel/scapegoat) (static code analysis).


## Available versions
There are two types of images available: images with [sonar-scala](https://github.com/mwz/sonar-scala) plugin, which can be mounted as a volume into a SonarQube container and images which bundle sonar-scala plugin with SonarQube server (suffixed with `-full`).

Starting from version `2.7.0`, the images no longer contain the [sonar-scala-extra](https://github.com/arthepsy/sonar-scala-extra) plugin as sonar-scala provides Scapegoat support from version `6.5.0` onwards.

#### Current
- `3.5.0` (latest) [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/3.5.0/Dockerfile), `3.5.0-full` [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/3.5.0-full/Dockerfile), [Release 3.5.0](https://github.com/mwz/sonar-scala-docker/releases/tag/3.5.0)
- `2.11.0` (LTS) [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.11.0/Dockerfile), `2.11.0-full` (LTS) [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.11.0-full/Dockerfile), [Release 2.11.0](https://github.com/mwz/sonar-scala-docker/releases/tag/2.11.0)
#### Older
- `3.4.0` [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/3.4.0/Dockerfile), `3.4.0-full` [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/3.4.0-full/Dockerfile), [Release 3.4.0](https://github.com/mwz/sonar-scala-docker/releases/tag/3.4.0)
- `3.3.0` [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/3.3.0/Dockerfile), `3.3.0-full` [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/3.3.0-full/Dockerfile), [Release 3.3.0](https://github.com/mwz/sonar-scala-docker/releases/tag/3.3.0)
- `3.2.1` [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/3.2.1/Dockerfile), `3.2.1-full` [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/3.2.1-full/Dockerfile), [Release 3.2.1](https://github.com/mwz/sonar-scala-docker/releases/tag/3.2.1)
- `3.2.0` [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/3.2.0/Dockerfile), `3.2.0-full` [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/3.2.0-full/Dockerfile), [Release 3.2.0](https://github.com/mwz/sonar-scala-docker/releases/tag/3.2.0)
- `3.1.0` [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/3.1.0/Dockerfile), `3.1.0-full` [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/3.1.0-full/Dockerfile), [Release 3.1.0](https://github.com/mwz/sonar-scala-docker/releases/tag/3.1.0)
- `3.0.0` [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/3.0.0/Dockerfile), `3.0.0-full` [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/3.0.0-full/Dockerfile), [Release 3.0.0](https://github.com/mwz/sonar-scala-docker/releases/tag/3.0.0)
- `2.10.0` (LTS) [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.10.0/Dockerfile), `2.10.0-full` (LTS) [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.10.0-full/Dockerfile), [Release 2.10.0](https://github.com/mwz/sonar-scala-docker/releases/tag/2.10.0)
- `2.9.0` (LTS) [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.9.0/Dockerfile), `2.9.0-full` (LTS) [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.9.0-full/Dockerfile), [Release 2.9.0](https://github.com/mwz/sonar-scala-docker/releases/tag/2.9.0)
- `2.8.0` (LTS) [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.8.0/Dockerfile), `2.8.0-full` (LTS) [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.8.0-full/Dockerfile), [Release 2.8.0](https://github.com/mwz/sonar-scala-docker/releases/tag/2.8.0)
- `2.7.0` (LTS) [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.7.0/Dockerfile), `2.7.0-full` (LTS) [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.7.0-full/Dockerfile), [Release 2.7.0](https://github.com/mwz/sonar-scala-docker/releases/tag/2.7.0)
- `2.6.0` (LTS) [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.6.0/Dockerfile), `2.6.0-full` (LTS) [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.6.0-full/Dockerfile), [Release 2.6.0](https://github.com/mwz/sonar-scala-docker/releases/tag/2.6.0)
- `2.5.0` (LTS) [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.5.0/Dockerfile), `2.5.0-full` (LTS) [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.5.0-full/Dockerfile), [Release 2.5.0](https://github.com/mwz/sonar-scala-docker/releases/tag/2.5.0)
- `2.4.0` (LTS) [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.4.0/Dockerfile), `2.4.0-full` (LTS) [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.4.0-full/Dockerfile), [Release 2.4.0](https://github.com/mwz/sonar-scala-docker/releases/tag/2.4.0)
- `2.3.0` (LTS) [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.3.0/Dockerfile), `2.3.0-full` (LTS) [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.3.0-full/Dockerfile), [Release 2.3.0](https://github.com/mwz/sonar-scala-docker/releases/tag/2.3.0)
- `2.2.1` (LTS) [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.2.1/Dockerfile), `2.2.1-full` (LTS) [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.2.1-full/Dockerfile), [Release 2.2.1](https://github.com/mwz/sonar-scala-docker/releases/tag/2.2.1)
- `2.2.0` (LTS) [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.2.0/Dockerfile), `2.2.0-full` (LTS) [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.2.0-full/Dockerfile), [Release 2.2.0](https://github.com/mwz/sonar-scala-docker/releases/tag/2.2.0)
- `2.1.0` (LTS) [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.1.0/Dockerfile), `2.1.0-full` (LTS) [Dockerfile](https://github.com/mwz/sonar-scala-docker/blob/master/2.1.0-full/Dockerfile), [Release 2.1.0](https://github.com/mwz/sonar-scala-docker/releases/tag/2.1.0)


## What's included
Version | SonarQube | sonar-scala | sonar-scala-extra
--------|-----------|-------------|------------------
3.5.0 || 7.4.0
3.5.0-full | 7.6 | 7.4.0
3.4.0 || 7.3.1
3.4.0-full | 7.4 | 7.3.1
3.3.0 || 7.3.0
3.3.0-full | 7.4 | 7.3.0
3.2.1 || 7.2.0
3.2.1-full | 7.4 | 7.2.0
3.2.0 || 7.2.0
3.2.0-full | 7.4 | 7.2.0
3.1.0 || 7.1.0
3.1.0-full | 7.4 | 7.1.0
3.0.0 || 7.0.0
3.0.0-full | 7.3 | 7.0.0
2.11.0 || 6.8.0 | 
2.11.0-full | 6.7.6 LTS | 6.8.0 | 
2.10.0 || 6.7.0 | 
2.10.0-full | 6.7.6 LTS | 6.7.0 | 
2.9.0 || 6.6.0 | 
2.9.0-full | 6.7.5 LTS | 6.6.0 | 
2.8.0 || 6.5.1 | 
2.8.0-full | 6.7.5 LTS | 6.5.1 | 
2.7.0 || 6.5.0 | 
2.7.0-full | 6.7.4 LTS | 6.5.0 | 
2.6.0 || 6.4.0 | 1.3.0
2.6.0-full | 6.7.4 LTS | 6.4.0 | 1.3.0
2.5.0 || 6.4.0 | 1.3.0
2.5.0-full | 6.7.3 LTS | 6.4.0 | 1.3.0
2.4.0 || 6.3.0 | 1.3.0
2.4.0-full | 6.7.3 LTS | 6.3.0 | 1.3.0
2.3.0 || 6.2.0 | 1.3.0
2.3.0-full | 6.7.3 LTS | 6.2.0 | 1.3.0
2.2.1 || 6.1.0 | 1.3.0
2.2.1-full | 6.7.3 LTS | 6.1.0 | 1.3.0
2.2.0 || 6.1.0 | 1.3.0
2.2.0-full | 6.7.2 LTS | 6.1.0 | 1.3.0
2.1.0 || 6.0.0 | 1.3.0
2.1.0-full | 6.7.1 LTS | 6.0.0 | 1.3.0


## Usage
To use one of the volume images, mount it as a volume to your existing SonarQube container using e.g. `docker-compose`:
```
version: "2"

services:
  sonarqube:
    image: sonarqube:7.4-community
    ports:
      - "80:9000"
    networks:
      - sonarnet
    volumes_from:
      - plugins

  plugins:
    image: mwizner/sonarqube-scala-plugins:3.5.0
    volumes:
      - sonarqube_plugins:/opt/sonarqube/extensions/plugins
    command: /bin/true

networks:
  sonarnet:
    driver: bridge

volumes:
  sonarqube_plugins:
```

You can find the full recipe [here](https://github.com/mwz/sonar-scala-docker/blob/master/docker-compose.yml) and [here](https://github.com/mwz/sonar-scala-docker/blob/master/docker-compose-lts.yml) (for the LTS version).

To use the `full` image, run the following `docker` command:
```bash
docker run -d \
  --name sonarqube-scala-plugins-full \
  -p 80:9000 \
  -e SONARQUBE_JDBC_USERNAME=sonar \
  -e SONARQUBE_JDBC_PASSWORD=sonar \
  -e SONARQUBE_JDBC_URL=jdbc:postgresql://localhost/sonar \
  mwizner/sonarqube-scala-plugins:3.5.0-full
```

Please note that if you don't specify the `SONARQUBE_JDBC_URL` variable, SonarQube will use an embedded H2 database, which is not recommended in production, but if you don't have access to an existing database or you just want to try the image, you can use the following command:
```bash
docker run -d \
  --name sonarqube-scala-plugins-full \
  -p 80:9000 \
  mwizner/sonarqube-scala-plugins:3.5.0-full
```


## Repository
This project is open-sourced and can be found on [Github](https://github.com/mwz/sonar-scala-docker).
