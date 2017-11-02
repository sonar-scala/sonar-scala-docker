# sonarqube-scala-docker
A docker-compose recipe for out-of-the-box [SonarQube LTS](https://www.sonarqube.org) instance with support for [Scala](http://www.scala-lang.org), [Scoverage](https://github.com/scoverage/scalac-scoverage-plugin) (code coverage metrics) and [Scalastyle](http://www.scalastyle.org) + [Scapegoat](https://github.com/sksamuel/scapegoat) (static code analysis). :sunglasses:


## Usage
To start SonarQube in a daemon mode, simply run:

```bash
docker-compose up -d
```

Once docker pulls all the required images and starts up the containers, the application should become available on [http://localhost](http://localhost). The default SonarQube login details for the Administrator account are `admin:admin`.


## Dependencies
 * [SonarQube 5.6.7 LTS](https://hub.docker.com/_/sonarqube)
 * [PostgreSQL 9](https://hub.docker.com/_/postgres)
 * External SonarQube plugins:
   * [Sagacify/sonar-scala](https://github.com/Sagacify/sonar-scala) - provides support for scalastyle and scoverage.
   * [arthepsy/sonar-scala-extra](https://github.com/arthepsy/sonar-scala-extra) - adds scapegoat inspections.


## License
The project is licensed under the Apache License v2. See the [LICENSE file](LICENSE) for more details.
