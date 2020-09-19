# sonar-scala-docker

[![GitHub version](<https://img.shields.io/badge/release_(for_SonarQube_8.4.2)-v5.5.0-blue.svg>)](https://github.com/mwz/sonarqube-scala-docker/releases)
[![GitHub version lts](<https://img.shields.io/badge/release_(for_SonarQube_LTS_7.9)-v4.2.0-blue.svg>)](https://github.com/mwz/sonarqube-scala-docker/releases)
[![GitHub version lts 6.7](<https://img.shields.io/badge/release_(for_SonarQube_LTS_6.7)-v2.12.0-blue.svg>)](https://github.com/mwz/sonarqube-scala-docker/releases)
[![Docker Pulls](https://img.shields.io/docker/pulls/mwizner/sonarqube-scala-plugins.svg)](https://hub.docker.com/r/mwizner/sonarqube-scala-plugins)

Docker images and docker-compose recipes for out-of-the-box
[SonarQube 6.7 LTS](https://www.sonarqube.org/sonarqube-6-7-lts),
[SonarQube 7.9 LTS](https://www.sonarqube.org/sonarqube-7-9-lts) and
[SonarQube 8.4.2](https://www.sonarqube.org) instance with support
for [Scala](http://www.scala-lang.org),
[Scoverage](https://github.com/scoverage/scalac-scoverage-plugin) (code coverage
metrics) and [Scalastyle](http://www.scalastyle.org) +
[Scapegoat](https://github.com/sksamuel/scapegoat) (static code analysis).
:sunglasses:

## Usage

To start SonarQube in a daemon mode, simply run:

```bash
docker-compose up -d
```

or the following for the LTS version:

```bash
docker-compose -f docker-compose-lts.yml up -d
```

Once docker pulls all the required images and starts up the containers, the
application should become available on [http://localhost](http://localhost). The
default SonarQube login details for the Administrator account are `admin:admin`.

You can also use a standalone docker image which contains SonarQube server with
bundled sonar-scala plugin,
[`mwizner/sonarqube-scala-plugins:5.5.0-full`](https://hub.docker.com/r/mwizner/sonarqube-scala-plugins)(or
`mwizner/sonarqube-scala-plugins:latest-full`) and
[`mwizner/sonarqube-scala-plugins:4.2.0-full`](https://hub.docker.com/r/mwizner/sonarqube-scala-plugins)
(or `mwizner/sonarqube-scala-plugins:latest-lts-full`) for the current LTS
version. Alternatively, we also provide an image for the old SonarQube 6.7 LTS
version -
[`mwizner/sonarqube-scala-plugins:2.12.0-full`](https://hub.docker.com/r/mwizner/sonarqube-scala-plugins)

To start the container issue the following command:  
_See the version compatibility matrix [below](#compatibility-matrix) to
determine which version you should use._

```bash
docker run -d \
  --name sonarqube-scala-plugins-full \
  -p 80:9000 \
  -e SONARQUBE_JDBC_USERNAME=sonar \
  -e SONARQUBE_JDBC_PASSWORD=sonar \
  -e SONARQUBE_JDBC_URL=jdbc:postgresql://localhost/sonar \
  mwizner/sonarqube-scala-plugins:5.5.0-full
```

Please note that if you don't specify the `SONARQUBE_JDBC_URL` variable,
SonarQube will use an embedded H2 database, which is not recommended in
production, but if you don't have access to an existing database or you just
want to try the image, you can use the following command:

```bash
docker run -d \
  --name sonarqube-scala-plugins-full \
  -p 80:9000 \
  mwizner/sonarqube-scala-plugins:5.5.0-full
```

## Dependencies

- [SonarQube 6.7 LTS](https://hub.docker.com/_/sonarqube) /
  [SonarQube 7.9 LTS](https://hub.docker.com/_/sonarqube) /
  [SonarQube 8.4.2](https://hub.docker.com/_/sonarqube)
- [PostgreSQL 12](https://hub.docker.com/_/postgres)
- [mwz/sonar-scala](https://github.com/mwz/sonar-scala) - provides support for
  scalastyle, scoverage and scapegoat

_(versions before `2.7.0` used
[arthepsy/sonar-scala-extra](https://github.com/arthepsy/sonar-scala-extra) for
scapegoat support)_

## Compatibility Matrix

<!-- prettier-ignore-start -->
|Version | SonarQube | sonar-scala |
|--------|-----------|-------------|
[5.5.0](https://github.com/mwz/sonarqube-scala-docker/releases/tag/5.5.0) | 8.4.2 [documentation](https://docs.sonarqube.org/8.4), [changelog](https://jira.sonarsource.com/secure/ReleaseNote.jspa?projectId=10930&version=15833) | [8.5.0](https://github.com/mwz/sonar-scala/releases/tag/v8.5.0)
[4.2.0](https://github.com/mwz/sonarqube-scala-docker/releases/tag/4.2.0) | 7.9.1 LTS [documentation](https://docs.sonarqube.org/7.9), [changelog](https://jira.sonarsource.com/secure/ReleaseNote.jspa?projectId=10930&version=15029) | [7.9.0](https://github.com/mwz/sonar-scala/releases/tag/v7.9.0)
[2.12.0](https://github.com/mwz/sonarqube-scala-docker/releases/tag/2.12.0) | 6.7.7 LTS [documentation](https://docs.sonarqube.org/display/SONARQUBE67/Documentation), [changelog](https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14865) | [6.8.0](https://github.com/mwz/sonar-scala/releases/tag/v6.8.0)
<!-- prettier-ignore-end -->

<details>
  <summary>Other versions</summary>
  <table>
    <tr>
        <td><b>Version</b></td>
        <td><b>SonarQube</b></td>
        <td><b>sonar-scala</b></td>
        <td><b>sonar-scala-extra</b></td>
    </tr>
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/5.4.0">5.4.0</a></td>
        <td>8.3.1 <a href="https://docs.sonarqube.org/8.3">documentation</a>, <a href="https://jira.sonarsource.com/secure/ReleaseNote.jspa?projectId=10930&version=15640">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v8.4.0">8.4.0</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/5.3.0">5.3.0</a></td>
        <td>8.3.1 <a href="https://docs.sonarqube.org/8.3">documentation</a>, <a href="https://jira.sonarsource.com/secure/ReleaseNote.jspa?projectId=10930&version=15640">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v8.3.0">8.3.0</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/5.2.0">5.2.0</a></td>
        <td>8.2 <a href="https://docs.sonarqube.org/8.2">documentation</a>, <a href="https://jira.sonarsource.com/secure/ReleaseNote.jspa?projectId=10930&version=15301">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v8.2.0">8.2.0</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/5.1.0">5.1.0</a></td>
        <td>8.1 <a href="https://docs.sonarqube.org/8.1">documentation</a>, <a href="https://jira.sonarsource.com/secure/ReleaseNote.jspa?projectId=10930&version=15243">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v8.1.0">8.1.0</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/5.0.0">5.0.0</a></td>
        <td>8.1 <a href="https://docs.sonarqube.org/8.1">documentation</a>, <a href="https://jira.sonarsource.com/secure/ReleaseNote.jspa?projectId=10930&version=15243">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v8.0.0">8.0.0</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/3.7.0">3.7.0</a></td>
        <td>7.8 <a href="https://docs.sonarqube.org/7.8">documentation</a>, <a href="https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14939">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v7.6.0">7.6.0</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/3.6.0">3.6.0</a></td>
        <td>7.7 <a href="https://docs.sonarqube.org/7.7">documentation</a>, <a href="https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14848">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v7.5.0">7.5.0</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/3.5.0">3.5.0</a></td>
        <td>7.6 <a href="https://docs.sonarqube.org/7.6">documentation</a>, <a href="https://jira.sonarsource.com/secure/ReleaseNote.jspa?version=14753&projectId=10930">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v7.4.0">7.4.0</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/3.4.0">3.4.0</a></td>
        <td>7.4 <a href="https://docs.sonarqube.org/7.4">documentation</a>, <a href="https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14549">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v7.3.1">7.3.1</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/3.3.0">3.3.0</a></td>
        <td>7.4 <a href="https://docs.sonarqube.org/7.4">documentation</a>, <a href="https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14549">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v7.3.0">7.3.0</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/3.2.1">3.2.1</a></td>
        <td>7.4 <a href="https://docs.sonarqube.org/7.4">documentation</a>, <a href="https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14549">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v7.2.0">7.2.0</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/3.2.0">3.2.0</a></td>
        <td>7.4 <a href="https://docs.sonarqube.org/7.4">documentation</a>, <a href="https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14549">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v7.2.0">7.2.0</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/3.1.0">3.1.0</a></td>
        <td>7.4 <a href="https://docs.sonarqube.org/7.4">documentation</a>, <a href="https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14549">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v7.1.0">7.1.0</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/3.0.0">3.0.0</a></td>
        <td>7.3 <a href="https://docs.sonarqube.org/display/SONARQUBE73/Documentation">documentation</a>, <a href="https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14464">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v7.0.0">7.0.0</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/4.1.0">4.1.0</a></td>
        <td>7.9.1 LTS <a href="https://docs.sonarqube.org/7.9">documentation</a>, <a href="https://jira.sonarsource.com/secure/ReleaseNote.jspa?projectId=10930&version=15029">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v7.8.0">7.8.0</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/4.0.0">4.0.0</a></td>
        <td>7.9.1 LTS <a href="https://docs.sonarqube.org/7.9">documentation</a>, <a href="https://jira.sonarsource.com/secure/ReleaseNote.jspa?projectId=10930&version=15029">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v7.7.0">7.7.0</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/2.12.0">2.12.0</a></td>
        <td>6.7.7 LTS <a href="https://docs.sonarqube.org/display/SONARQUBE67/Documentation">documentation</a>, <a href="https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14865">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v6.8.0">6.8.0</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/2.11.0">2.11.0</a></td>
        <td>6.7.6 LTS <a href="https://docs.sonarqube.org/display/SONARQUBE67/Documentation">documentation</a>, <a href="https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=13972">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v6.8.0">6.8.0</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/2.10.0">2.10.0</a></td>
        <td>6.7.6 LTS <a href="https://docs.sonarqube.org/display/SONARQUBE67/Documentation">documentation</a>, <a href="https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=13972">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v6.7.0">6.7.0</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/2.9.0">2.9.0</a></td>
        <td>6.7.5 LTS <a href="https://docs.sonarqube.org/display/SONARQUBE67/Documentation">documentation</a>, <a href="https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14467">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v6.6.0">6.6.0</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/2.8.0">2.8.0</a></td>
        <td>6.7.5 LTS <a href="https://docs.sonarqube.org/display/SONARQUBE67/Documentation">documentation</a>, <a href="https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14467">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v6.5.1">6.5.1</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/2.7.0">2.7.0</a></td>
        <td>6.7.4 LTS <a href="https://docs.sonarqube.org/display/SONARQUBE67/Documentation">documentation</a>, <a href="https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14377">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v6.5.0">6.5.0</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/2.6.0">2.6.0</a></td>
        <td>6.7.4 LTS <a href="https://docs.sonarqube.org/display/SONARQUBE67/Documentation">documentation</a>, <a href="https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14377">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v6.4.0">6.4.0</td>
        <td><a href="https://github.com/arthepsy/sonar-scala-extra/releases/tag/v1.3.0">1.3.0</a></td>
    </tr>
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/2.5.0">2.5.0</a></td>
        <td>6.7.3 LTS <a href="https://docs.sonarqube.org/display/SONARQUBE67/Documentation">documentation</a>, <a href="https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14264">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v6.4.0">6.4.0</td>
        <td><a href="https://github.com/arthepsy/sonar-scala-extra/releases/tag/v1.3.0">1.3.0</a></td>
    </tr>
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/2.4.0">2.4.0</a></td>
        <td>6.7.3 LTS <a href="https://docs.sonarqube.org/display/SONARQUBE67/Documentation">documentation</a>, <a href="https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14264">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v6.3.0">6.3.0</td>
        <td><a href="https://github.com/arthepsy/sonar-scala-extra/releases/tag/v1.3.0">1.3.0</a></td>
    </tr>
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/2.3.0">2.3.0</a></td>
        <td>6.7.3 LTS <a href="https://docs.sonarqube.org/display/SONARQUBE67/Documentation">documentation</a>, <a href="https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14264">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v6.2.0">6.2.0</td>
        <td><a href="https://github.com/arthepsy/sonar-scala-extra/releases/tag/v1.3.0">1.3.0</a></td>
    </tr>
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/2.2.1">2.2.1</a></td>
        <td>6.7.3 LTS <a href="https://docs.sonarqube.org/display/SONARQUBE67/Documentation">documentation</a>, <a href="https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14264">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v6.1.0">6.1.0</td>
        <td><a href="https://github.com/arthepsy/sonar-scala-extra/releases/tag/v1.3.0">1.3.0</a></td>
    </tr>
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/2.2.0">2.2.0</a></td>
        <td>6.7.2 LTS <a href="https://docs.sonarqube.org/display/SONARQUBE67/Documentation">documentation</a>, <a href="https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14191">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v6.1.0">6.1.0</td>
        <td><a href="https://github.com/arthepsy/sonar-scala-extra/releases/tag/v1.3.0">1.3.0</a></td>
    </tr>
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/2.1.0">2.1.0</a></td>
        <td>6.7.1 LTS <a href="https://docs.sonarqube.org/display/SONARQUBE67/Documentation">documentation</a>, <a href="https://jira.sonarsource.com/jira/secure/ReleaseNote.jspa?projectId=10930&version=14137">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v6.0.0">6.0.0</td>
        <td><a href="https://github.com/arthepsy/sonar-scala-extra/releases/tag/v1.3.0">1.3.0</a></td>
    </tr>
  </table>
</details>
<br>

_Please note, that starting from version `2.7.0`, the images no longer contain
the [sonar-scala-extra](https://github.com/arthepsy/sonar-scala-extra) plugin as
sonar-scala provides Scapegoat support from version `6.5.0` onwards._

## Recommendations

[sbt-sonar](https://github.com/mwz/sbt-sonar) is an sbt plugin which provides a
way to automate analysis of Scala projects with SonarQube.

## Changelog

<details>
  <summary>Expand to see the changelog.</summary>
  <ul>
    <li><strong>5.5.0</strong> - Upgraded sonar-scala to 8.5.0 & SonarQube to 8.4.</li>
    <li><strong>5.4.0</strong> - Upgraded sonar-scala to 8.4.0.</li>
    <li><strong>5.3.0</strong> - Upgraded sonar-scala to 8.3.0 & SonarQube to 8.3.</li>
    <li><strong>5.2.0</strong> - Upgraded sonar-scala to 8.2.0 & SonarQube to 8.2.</li>
    <li><strong>5.1.0</strong> - Upgraded sonar-scala to 8.1.0.</li>
    <li><strong>5.0.0</strong> - Upgraded sonar-scala to 8.0.0 & SonarQube to 8.1.</li>
    <li><strong>4.2.0</strong> - Upgraded sonar-scala to 7.9.0.</li>
    <li><strong>4.1.0</strong> - Upgraded sonar-scala to 7.8.0.</li>
    <li><strong>4.0.0</strong> - Upgraded sonar-scala to 7.7.0 & SonarQube to 7.9.1 LTS.</li>
    <li><strong>3.7.0</strong> - Upgraded sonar-scala to 7.6.0 & SonarQube to 7.8.</li>
    <li><strong>3.6.0</strong> - Upgraded sonar-scala to 7.5.0 & SonarQube to 7.7.</li>
    <li><strong>3.5.0</strong> - Upgraded sonar-scala to 7.4.0 & SonarQube to 7.6.</li>
    <li><strong>3.4.0</strong> - Upgraded sonar-scala to 7.3.1.</li>
    <li><strong>3.3.0</strong> - Upgraded sonar-scala to 7.3.0.</li>
    <li><strong>3.2.1</strong> - Fixed file system permissions.</li>
    <li><strong>3.2.0</strong> - Upgraded sonar-scala to 7.2.0.</li>
    <li><strong>3.1.0</strong> - Upgraded sonar-scala to 7.1.0 & SonarQube to 7.4.</li>
    <li><strong>3.0.0</strong> - Upgraded sonar-scala to 7.0.0 & SonarQube to 7.3.</li>
    <li><strong>2.12.0</strong> - Upgraded SonarQube to 6.7.7 LTS.</li>
    <li><strong>2.11.0</strong> - Upgraded sonar-scala to 6.8.0.</li>
    <li><strong>2.10.0</strong> - Upgraded sonar-scala to 6.7.0 & SonarQube to 6.7.6.</li>
    <li><strong>2.9.0</strong> - Upgraded sonar-scala to 6.6.0.</li>
    <li><strong>2.8.0</strong> - Upgraded sonar-scala to 6.5.1 & SonarQube to 6.7.5.</li>
    <li><strong>2.7.0</strong> - Upgraded sonar-scala to 6.5.0, which brings support for scapegoat.</li>
    <li><strong>2.6.0</strong> - Upgraded SonarQube to 6.7.4.</li>
    <li><strong>2.5.0</strong> - Upgraded sonar-scala to 6.4.0.</li>
    <li><strong>2.4.0</strong> - Upgraded sonar-scala to 6.3.0.</li>
    <li><strong>2.3.0</strong> - Upgraded sonar-scala to 6.2.0.</li>
    <li><strong>2.2.1</strong> - Upgraded SonarQube to 6.7.3 LTS.</li>
    <li><strong>2.2.0</strong> - Upgraded sonar-scala to 6.1.0 & SonarQube to 6.7.2 LTS.</li>
    <li><strong>2.1.0</strong> - Published docker image with Scala plugins to dockerhub
      [mwizner/sonarqube-scala-plugins](https://hub.docker.com/r/mwizner/sonarqube-scala-plugins).</li>
    <li><strong>2.0.0</strong> - SonarQube 6.7.1 LTS.</li>
    <li><strong>1.0.0</strong> - SonarQube 5.6.7 LTS.</li>
  </ul>
</details>

## License

The project is licensed under the Apache License v2. See the
[LICENSE file](LICENSE) for more details.
