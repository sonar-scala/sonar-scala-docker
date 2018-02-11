# sonarqube-scala-docker
[![GitHub version](https://img.shields.io/github/tag/mwz/sonarqube-scala-docker.svg?label=release)](https://github.com/mwz/sonarqube-scala-docker/releases)
[![Docker Pulls](https://img.shields.io/docker/pulls/mwizner/sonarqube-scala-plugins.svg)](https://hub.docker.com/r/mwizner/sonarqube-scala-plugins)

A docker-compose recipe for out-of-the-box [SonarQube LTS](https://www.sonarqube.org) instance with support for [Scala](http://www.scala-lang.org), [Scoverage](https://github.com/scoverage/scalac-scoverage-plugin) (code coverage metrics) and [Scalastyle](http://www.scalastyle.org) + [Scapegoat](https://github.com/sksamuel/scapegoat) (static code analysis). :sunglasses:


## Usage
To start SonarQube in a daemon mode, simply run:

```bash
docker-compose up -d
```

Once docker pulls all the required images and starts up the containers, the application should become available on [http://localhost](http://localhost). The default SonarQube login details for the Administrator account are `admin:admin`.


## Dependencies
 * [SonarQube 6.7.1 LTS](https://hub.docker.com/_/sonarqube)
 * [PostgreSQL 10.2](https://hub.docker.com/_/postgres)
 * External SonarQube plugins:
   * [mwz/sonar-scala](https://github.com/mwz/sonar-scala) - provides support for scalastyle and scoverage.
   * [arthepsy/sonar-scala-extra](https://github.com/arthepsy/sonar-scala-extra) - adds scapegoat inspections.


## Compatibility Matrix
Version | SonarQube | sonar-scala | sonar-scapegoat
--------|-----------|-------------|----------------
[2.1.0](https://github.com/mwz/sonarqube-scala-docker/releases/tag/2.0.0), [2.0.0](https://github.com/mwz/sonarqube-scala-docker/releases/tag/2.0.0) | 6.7.1 LTS ([documentation](https://docs.sonarqube.org/display/SONARQUBE67/Documentation)) ([what's new](https://www.sonarqube.org/sonarqube-6-7-lts)) | 6.0.0 | 1.3.0
[1.0.0](https://github.com/mwz/sonarqube-scala-docker/releases/tag/1.0.0) | 5.6.7 LTS ([documentation](https://docs.sonarqube.org/display/SONARQUBE56/Documentation)) | 0.0.3 | 1.3.0


## Recommendations
[sbt-sonar](https://github.com/mwz/sbt-sonar) is an sbt plugin which provides a way to automate analysis of Scala projects with SonarQube.

## Changelog
- **2.1.0** - Published docker image with Scala plugins to dockerhub [mwizner/sonarqube-scala-plugins](https://hub.docker.com/r/mwizner/sonarqube-scala-plugins).
- **2.0.0** - SonarQube 6.7.1 LTS (sonar-scala v6.0.0, sonar-scapegoat-plugin v1.3.0).
- **1.0.0** - SonarQube 5.6.7 LTS (sonar-scala v0.0.3, sonar-scapegoat-plugin v1.3.0).

## License
The project is licensed under the Apache License v2. See the [LICENSE file](LICENSE) for more details.
