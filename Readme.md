
# Docker Postgres For Testing

[![Docker Hub](https://img.shields.io/badge/docker-ready-blue.svg)](https://registry.hub.docker.com/u/labianchin/docker-postgres-for-testing/)

This a docker image based in the ![official Postgres 9.4 docker image](https://registry.hub.docker.com/_/postgres/) tweaked for database testing.

It basically configure things like turning off write ahead log (`fsync=off`) to make it faster. Notice that this can make the database more likely to be in an inconsistent state, if the case of a server crash. This is not a problem for database testing as we are more concerned with fast feedback and not about loosing data.

This is an alternative to ![H2](http://www.h2database.com/html/main.html), ![in memory SQLite](https://www.sqlite.org/inmemorydb.html) and ![HyperSQL](http://hsqldb.org/). You should consider this as it runs a real PostgreSQL server, that would be very close on what you have in production.

Check the file `config.sh` for all the configurations.

References:

- https://stackoverflow.com/questions/9407442/optimise-postgresql-for-fast-testing
- http://michael.robellard.com/2015/07/dont-test-with-sqllite-when-you-use.html