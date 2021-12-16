# sonar-scala-docker

[![GitHub version](<https://img.shields.io/badge/release_(for_SonarQube_{{current.sonar}})-v{{current.version}}-blue.svg>)](https://github.com/mwz/sonarqube-scala-docker/releases)
[![GitHub version lts](<https://img.shields.io/badge/release_(for_SonarQube_LTS_8.9)-v{{lts.version}}-blue.svg>)](https://github.com/mwz/sonarqube-scala-docker/releases)
[![GitHub version lts 7.9](<https://img.shields.io/badge/release_(for_SonarQube_LTS_7.9)-v{{lts79.version}}-blue.svg>)](https://github.com/mwz/sonarqube-scala-docker/releases)
[![GitHub version lts 6.7](<https://img.shields.io/badge/release_(for_SonarQube_LTS_6.7)-v{{lts67.version}}-blue.svg>)](https://github.com/mwz/sonarqube-scala-docker/releases)
[![Docker Pulls](https://img.shields.io/docker/pulls/mwizner/sonarqube-scala-plugins.svg)](https://hub.docker.com/r/mwizner/sonarqube-scala-plugins)

Docker images and docker-compose recipes for out-of-the-box
[SonarQube {{current.sonar}}](https://www.sonarqube.org),
[SonarQube 8.9 LTS](https://www.sonarqube.org/sonarqube-8-9-lts),
[SonarQube 7.9 LTS](https://www.sonarqube.org/sonarqube-7-9-lts) and
[SonarQube 6.7 LTS](https://www.sonarqube.org/sonarqube-6-7-lts) instance with
support for [Scala](http://www.scala-lang.org),
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
[`mwizner/sonarqube-scala-plugins:{{current.version}}-full`](https://hub.docker.com/r/mwizner/sonarqube-scala-plugins)(or
`mwizner/sonarqube-scala-plugins:latest-full`) and
[`mwizner/sonarqube-scala-plugins:{{lts.version}}-full`](https://hub.docker.com/r/mwizner/sonarqube-scala-plugins)
(or `mwizner/sonarqube-scala-plugins:latest-lts-full`) for the current LTS
version. Alternatively, we also provide an image for the old SonarQube 7.9 LTS
version -
[`mwizner/sonarqube-scala-plugins:{{lts79.version}}-full`](https://hub.docker.com/r/mwizner/sonarqube-scala-plugins)
and SonarQube 6.7 LTS version -
[`mwizner/sonarqube-scala-plugins:{{lts67.version}}-full`](https://hub.docker.com/r/mwizner/sonarqube-scala-plugins)

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

## Dependencies

- [SonarQube {{current.sonar}}](https://hub.docker.com/_/sonarqube) or
  [SonarQube 8.9 LTS](https://hub.docker.com/_/sonarqube) or
  [SonarQube 7.9 LTS](https://hub.docker.com/_/sonarqube) or
  [SonarQube 6.7 LTS](https://hub.docker.com/_/sonarqube)
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
[{{current.version}}](https://github.com/mwz/sonarqube-scala-docker/releases/tag/{{current.version}}) | {{current.sonar}} [documentation]({{{current.sonarDocs}}}), [changelog]({{{current.sonarChangelog}}}) | [{{current.sonarScala}}](https://github.com/mwz/sonar-scala/releases/tag/v{{current.sonarScala}})
[{{lts.version}}](https://github.com/mwz/sonarqube-scala-docker/releases/tag/{{lts.version}}) | {{lts.sonar}} [documentation]({{{lts.sonarDocs}}}), [changelog]({{{lts.sonarChangelog}}}) | [{{lts.sonarScala}}](https://github.com/mwz/sonar-scala/releases/tag/v{{lts.sonarScala}})
[{{lts79.version}}](https://github.com/mwz/sonarqube-scala-docker/releases/tag/{{lts79.version}}) | {{lts79.sonar}} [documentation]({{{lts79.sonarDocs}}}), [changelog]({{{lts79.sonarChangelog}}}) | [{{lts.sonarScala}}](https://github.com/mwz/sonar-scala/releases/tag/v{{lts79.sonarScala}})
[{{lts67.version}}](https://github.com/mwz/sonarqube-scala-docker/releases/tag/{{lts67.version}}) | {{lts67.sonar}} [documentation]({{{lts67.sonarDocs}}}), [changelog]({{{lts67.sonarChangelog}}}) | [{{lts67.sonarScala}}](https://github.com/mwz/sonar-scala/releases/tag/v{{lts67.sonarScala}})
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
    {{#versions.current}}
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/{{version}}">{{version}}</a></td>
        <td>{{sonar}} <a href="{{{sonarDocs}}}">documentation</a>, <a href="{{{sonarChangelog}}}">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v{{sonarScala}}">{{sonarScala}}</td>
        <td></td>
    </tr>
    {{/versions.current}}
    {{#versions.lts}}
    <tr>
        <td><a href="https://github.com/mwz/sonarqube-scala-docker/releases/tag/{{version}}">{{version}}</a></td>
        <td>{{sonar}} <a href="{{{sonarDocs}}}">documentation</a>, <a href="{{{sonarChangelog}}}">changelog</a></td>
        <td><a href="https://github.com/mwz/sonar-scala/releases/tag/v{{sonarScala}}">{{sonarScala}}</td>
        <td>{{#sonarScalaExtra}}<a href="https://github.com/arthepsy/sonar-scala-extra/releases/tag/v{{sonarScalaExtra}}">{{sonarScalaExtra}}</a>{{/sonarScalaExtra}}</td>
    </tr>
    {{/versions.lts}}
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
    <li><strong>5.8.0</strong> - Upgraded sonar-scala to 8.9.0 & SonarQube to 8.9.4.</li>
    <li><strong>5.7.0</strong> - Upgraded sonar-scala to 8.7.0 & SonarQube to 8.7.1.</li>
    <li><strong>5.6.0</strong> - Upgraded sonar-scala to 8.6.0 & SonarQube to 8.5.1.</li>
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
