# sonar-scala-docker
[![GitHub version](https://img.shields.io/badge/release-v3.6.0-blue.svg)](https://github.com/mwz/sonarqube-scala-docker/releases)
[![GitHub version lts](https://img.shields.io/badge/release_(LTS)-v2.12.0-blue.svg)](https://github.com/mwz/sonarqube-scala-docker/releases)
[![Docker Pulls](https://img.shields.io/docker/pulls/mwizner/sonarqube-scala-plugins.svg)](https://hub.docker.com/r/mwizner/sonarqube-scala-plugins)

Docker images and docker-compose recipes for out-of-the-box [SonarQube 6.7 LTS](https://www.sonarqube.org/sonarqube-6-7-lts) and [SonarQube 7.7](https://www.sonarqube.org/sonarqube-7-7) instance with support for [Scala](http://www.scala-lang.org), [Scoverage](https://github.com/scoverage/scalac-scoverage-plugin) (code coverage metrics) and [Scalastyle](http://www.scalastyle.org) + [Scapegoat](https://github.com/sksamuel/scapegoat) (static code analysis). :sunglasses:


## Usage
To start SonarQube in a daemon mode, simply run:

```bash
docker-compose up -d
```
or the following for the LTS version:
```bash
docker-compose -f docker-compose-lts.yml up -d
```

Once docker pulls all the required images and starts up the containers, the application should become available on [http://localhost](http://localhost). The default SonarQube login details for the Administrator account are `admin:admin`.

You can also use a standalone docker image which contains SonarQube server with bundled sonar-scala plugin, [`mwizner/sonarqube-scala-plugins:3.6.0-full`](https://hub.docker.com/r/mwizner/sonarqube-scala-plugins) and [`mwizner/sonarqube-scala-plugins:2.12.0-full`](https://hub.docker.com/r/mwizner/sonarqube-scala-plugins) for the LTS version.

To start the container issue the following command:
```bash
docker run -d \
  --name sonarqube-scala-plugins-full \
  -p 80:9000 \
  -e SONARQUBE_JDBC_USERNAME=sonar \
  -e SONARQUBE_JDBC_PASSWORD=sonar \
  -e SONARQUBE_JDBC_URL=jdbc:postgresql://localhost/sonar \
  mwizner/sonarqube-scala-plugins:3.6.0-full
```
Please note that if you don't specify the `SONARQUBE_JDBC_URL` variable, SonarQube will use an embedded H2 database, which is not recommended in production, but if you don't have access to an existing database or you just want to try the image, you can use the following command:
```bash
docker run -d \
  --name sonarqube-scala-plugins-full \
  -p 80:9000 \
  mwizner/sonarqube-scala-plugins:3.6.0-full
```


## Dependencies
 * [SonarQube 6.7 LTS](https://hub.docker.com/_/sonarqube) / [SonarQube 7.7](https://hub.docker.com/_/sonarqube)
 * [PostgreSQL 10](https://hub.docker.com/_/postgres)
 * [mwz/sonar-scala](https://github.com/mwz/sonar-scala) - provides support for scalastyle, scoverage and scapegoat
 * versions before `2.7.0` used [arthepsy/sonar-scala-extra](https://github.com/arthepsy/sonar-scala-extra) for scapegoat support


## Compatibility Matrix
Version | SonarQube | sonar-scala | sonar-scala-extra
--------|-----------|-------------|------------------
[3.6.0](https://github.com/mwz/sonarqube-scala-docker/releases/tag/3.6.0) | 7.7 ([documentation](https://docs.sonarqube.org/7.7))([changelog](https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14848)) | [7.5.0](https://github.com/mwz/sonar-scala/releases/tag/v7.5.0)
[3.5.0](https://github.com/mwz/sonarqube-scala-docker/releases/tag/3.5.0) | 7.6 ([documentation](https://docs.sonarqube.org/7.6))([changelog](https://jira.sonarsource.com/secure/ReleaseNote.jspa?version=14753&projectId=10930)) | [7.4.0](https://github.com/mwz/sonar-scala/releases/tag/v7.4.0)
[3.4.0](https://github.com/mwz/sonarqube-scala-docker/releases/tag/3.4.0) | 7.4 ([documentation](https://docs.sonarqube.org/7.4))([changelog](https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14549)) | [7.3.1](https://github.com/mwz/sonar-scala/releases/tag/v7.3.1)
[3.3.0](https://github.com/mwz/sonarqube-scala-docker/releases/tag/3.3.0) | 7.4 ([documentation](https://docs.sonarqube.org/7.4))([changelog](https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14549)) | [7.3.0](https://github.com/mwz/sonar-scala/releases/tag/v7.3.0)
[3.2.1](https://github.com/mwz/sonarqube-scala-docker/releases/tag/3.2.1) | 7.4 ([documentation](https://docs.sonarqube.org/7.4))([changelog](https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14549)) | [7.2.0](https://github.com/mwz/sonar-scala/releases/tag/v7.2.0)
[3.2.0](https://github.com/mwz/sonarqube-scala-docker/releases/tag/3.2.0) | 7.4 ([documentation](https://docs.sonarqube.org/7.4))([changelog](https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14549)) | [7.2.0](https://github.com/mwz/sonar-scala/releases/tag/v7.2.0)
[3.1.0](https://github.com/mwz/sonarqube-scala-docker/releases/tag/3.1.0) | 7.4 ([documentation](https://docs.sonarqube.org/7.4))([changelog](https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14549)) | [7.1.0](https://github.com/mwz/sonar-scala/releases/tag/v7.1.0)
[3.0.0](https://github.com/mwz/sonarqube-scala-docker/releases/tag/3.0.0) | 7.3 ([documentation](https://docs.sonarqube.org/display/SONARQUBE73/Documentation))([changelog](https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14464)) | [7.0.0](https://github.com/mwz/sonar-scala/releases/tag/v7.0.0)
[2.12.0](https://github.com/mwz/sonarqube-scala-docker/releases/tag/2.12.0) | 6.7.7 LTS ([documentation](https://docs.sonarqube.org/display/SONARQUBE67/Documentation))([changelog](https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14865)) | [6.8.0](https://github.com/mwz/sonar-scala/releases/tag/v6.8.0)
[2.11.0](https://github.com/mwz/sonarqube-scala-docker/releases/tag/2.11.0) | 6.7.6 LTS ([documentation](https://docs.sonarqube.org/display/SONARQUBE67/Documentation))([changelog](https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=13972)) | [6.8.0](https://github.com/mwz/sonar-scala/releases/tag/v6.8.0) | 
[2.10.0](https://github.com/mwz/sonarqube-scala-docker/releases/tag/2.10.0) | 6.7.6 LTS ([documentation](https://docs.sonarqube.org/display/SONARQUBE67/Documentation))([changelog](https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=13972)) | [6.7.0](https://github.com/mwz/sonar-scala/releases/tag/v6.7.0) | 
[2.9.0](https://github.com/mwz/sonarqube-scala-docker/releases/tag/2.9.0) | 6.7.5 LTS ([documentation](https://docs.sonarqube.org/display/SONARQUBE67/Documentation))([changelog](https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14467)) | [6.6.0](https://github.com/mwz/sonar-scala/releases/tag/v6.6.0) | 
[2.8.0](https://github.com/mwz/sonarqube-scala-docker/releases/tag/2.8.0) | 6.7.5 LTS ([documentation](https://docs.sonarqube.org/display/SONARQUBE67/Documentation))([changelog](https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14467)) | [6.5.1](https://github.com/mwz/sonar-scala/releases/tag/v6.5.1) | 
[2.7.0](https://github.com/mwz/sonarqube-scala-docker/releases/tag/2.7.0) | 6.7.4 LTS ([documentation](https://docs.sonarqube.org/display/SONARQUBE67/Documentation))([changelog](https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14377)) | [6.5.0](https://github.com/mwz/sonar-scala/releases/tag/v6.5.0) | 
[2.6.0](https://github.com/mwz/sonarqube-scala-docker/releases/tag/2.6.0) | 6.7.4 LTS ([documentation](https://docs.sonarqube.org/display/SONARQUBE67/Documentation))([changelog](https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14377)) | [6.4.0](https://github.com/mwz/sonar-scala/releases/tag/v6.4.0) | [1.3.0](https://github.com/arthepsy/sonar-scala-extra/releases/tag/v1.3.0)
[2.5.0](https://github.com/mwz/sonarqube-scala-docker/releases/tag/2.5.0) | 6.7.3 LTS ([documentation](https://docs.sonarqube.org/display/SONARQUBE67/Documentation))([changelog](https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14264)) | [6.4.0](https://github.com/mwz/sonar-scala/releases/tag/v6.4.0) | [1.3.0](https://github.com/arthepsy/sonar-scala-extra/releases/tag/v1.3.0)
[2.4.0](https://github.com/mwz/sonarqube-scala-docker/releases/tag/2.4.0) | 6.7.3 LTS ([documentation](https://docs.sonarqube.org/display/SONARQUBE67/Documentation))([changelog](https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14264)) | [6.3.0](https://github.com/mwz/sonar-scala/releases/tag/v6.3.0) | [1.3.0](https://github.com/arthepsy/sonar-scala-extra/releases/tag/v1.3.0)
[2.3.0](https://github.com/mwz/sonarqube-scala-docker/releases/tag/2.3.0) | 6.7.3 LTS ([documentation](https://docs.sonarqube.org/display/SONARQUBE67/Documentation))([changelog](https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14264)) | [6.2.0](https://github.com/mwz/sonar-scala/releases/tag/v6.2.0) | [1.3.0](https://github.com/arthepsy/sonar-scala-extra/releases/tag/v1.3.0)
[2.2.1](https://github.com/mwz/sonarqube-scala-docker/releases/tag/2.2.1) | 6.7.3 LTS ([documentation](https://docs.sonarqube.org/display/SONARQUBE67/Documentation))([changelog](https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14264)) | [6.1.0](https://github.com/mwz/sonar-scala/releases/tag/v6.1.0) | [1.3.0](https://github.com/arthepsy/sonar-scala-extra/releases/tag/v1.3.0)
[2.2.0](https://github.com/mwz/sonarqube-scala-docker/releases/tag/2.2.0) | 6.7.2 LTS ([documentation](https://docs.sonarqube.org/display/SONARQUBE67/Documentation))([changelog](https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14191)) | [6.1.0](https://github.com/mwz/sonar-scala/releases/tag/v6.1.0) | [1.3.0](https://github.com/arthepsy/sonar-scala-extra/releases/tag/v1.3.0)
[2.1.0](https://github.com/mwz/sonarqube-scala-docker/releases/tag/2.1.0) | 6.7.1 LTS ([documentation](https://docs.sonarqube.org/display/SONARQUBE67/Documentation))([changelog](https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14137)) | [6.0.0](https://github.com/mwz/sonar-scala/releases/tag/v6.0.0) | [1.3.0](https://github.com/arthepsy/sonar-scala-extra/releases/tag/v1.3.0)


Please note, that starting from version `2.7.0`, the images no longer contain the [sonar-scala-extra](https://github.com/arthepsy/sonar-scala-extra) plugin as sonar-scala provides Scapegoat support from version `6.5.0` onwards.

## Recommendations
[sbt-sonar](https://github.com/mwz/sbt-sonar) is an sbt plugin which provides a way to automate analysis of Scala projects with SonarQube.


## Changelog
- **3.6.0** - Upgraded sonar-scala to 7.5.0 & SonarQube to 7.7.
- **3.5.0** - Upgraded sonar-scala to 7.4.0 & SonarQube to 7.6.
- **3.4.0** - Upgraded sonar-scala to 7.3.1.
- **3.3.0** - Upgraded sonar-scala to 7.3.0.
- **3.2.1** - Fixed file system permissions.
- **3.2.0** - Upgraded sonar-scala to 7.2.0.
- **3.1.0** - Upgraded sonar-scala to 7.1.0 & SonarQube to 7.4.
- **3.0.0** - Upgraded sonar-scala to 7.0.0 & SonarQube to 7.3.
- **2.12.0** - Upgraded SonarQube to 6.7.7 LTS.
- **2.11.0** - Upgraded sonar-scala to 6.8.0.
- **2.10.0** - Upgraded sonar-scala to 6.7.0 & SonarQube to 6.7.6.
- **2.9.0** - Upgraded sonar-scala to 6.6.0.
- **2.8.0** - Upgraded sonar-scala to 6.5.1 & SonarQube to 6.7.5.
- **2.7.0** - Upgraded sonar-scala to 6.5.0, which brings support for scapegoat.
- **2.6.0** - Upgraded SonarQube to 6.7.4.
- **2.5.0** - Upgraded sonar-scala to 6.4.0.
- **2.4.0** - Upgraded sonar-scala to 6.3.0.
- **2.3.0** - Upgraded sonar-scala to 6.2.0.
- **2.2.1** - Upgraded SonarQube to 6.7.3 LTS.
- **2.2.0** - Upgraded sonar-scala to 6.1.0 & SonarQube to 6.7.2 LTS.
- **2.1.0** - Published docker image with Scala plugins to dockerhub [mwizner/sonarqube-scala-plugins](https://hub.docker.com/r/mwizner/sonarqube-scala-plugins).
- **2.0.0** - SonarQube 6.7.1 LTS.
- **1.0.0** - SonarQube 5.6.7 LTS.


## License
The project is licensed under the Apache License v2. See the [LICENSE file](LICENSE) for more details.
