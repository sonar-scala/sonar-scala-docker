# sonarqube-scala-docker
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
Version | SonarQube version
--------|------------------
[2.0.0](https://github.com/mwz/sonarqube-scala-docker/releases/tag/2.0.0)   | 6.7.1 LTS ([documentation](https://docs.sonarqube.org/display/SONARQUBE67/Documentation)) ([what's new](https://www.sonarqube.org/sonarqube-6-7-lts))
[1.0.0](https://github.com/mwz/sonarqube-scala-docker/releases/tag/1.0.0)   | 5.6.7 LTS ([documentation](https://docs.sonarqube.org/display/SONARQUBE56/Documentation))


## Recommendations
[sbt-sonar](https://github.com/mwz/sbt-sonar) is an sbt plugin which provides a way to automate analysis of Scala projects with SonarQube.

## License
The project is licensed under the Apache License v2. See the [LICENSE file](LICENSE) for more details.
