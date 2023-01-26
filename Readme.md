
# Docker Postgres For Testing

[![Docker Hub](https://img.shields.io/badge/docker-ready-blue.svg)](https://registry.hub.docker.com/u/dhlparcel/docker-postgres-for-testing/)
[![Docker Stars](https://img.shields.io/docker/stars/dhlparcel/docker-postgres-for-testing.svg)](https://registry.hub.docker.com/u/dhlparcel/docker-postgres-for-testing/)
[![Docker Pulls](https://img.shields.io/docker/pulls/dhlparcel/docker-postgres-for-testing.svg)](https://registry.hub.docker.com/u/dhlparcel/docker-postgres-for-testing/)
[![Image Size](https://img.shields.io/imagelayers/image-size/dhlparcel/docker-postgres-for-testing/latest.svg)](https://imagelayers.io/?images=dhlparcel/docker-postgres-for-testing:latest)
[![Image Layers](https://img.shields.io/imagelayers/layers/dhlparcel/docker-postgres-for-testing/latest.svg)](https://imagelayers.io/?images=dhlparcel/docker-postgres-for-testing:latest)

This a docker image based in the [official Postgres 15.1 docker image](https://registry.hub.docker.com/_/postgres/) tweaked for database testing.

It basically configure things like turning off write ahead log (`fsync=off`) to make it faster. Notice that this can make the database more likely to be in an inconsistent state, if the case of a server crash. This is not a problem for database testing as we are more concerned with fast feedback and not about loosing data.

This is an alternative to [H2](http://www.h2database.com/html/main.html), [in memory SQLite](https://www.sqlite.org/inmemorydb.html) and [HyperSQL](http://hsqldb.org/). You should consider this as it runs a real PostgreSQL server, that would be very close on what you have in production.

Check the file `config.sh` for all the configurations.

References:

- https://stackoverflow.com/questions/9407442/optimise-postgresql-for-fast-testing
- http://michael.robellard.com/2015/07/dont-test-with-sqllite-when-you-use.html

## Tips for writing tests

- Do all schema setup (DDL) once before running the tests
- Run the schema setup (DDL), as the DB migration that would run in production
- Avoid DDL in each test, as that tent to be very slow
- Before each test, truncate the tables and put some seed data (DML), that should be quick
- Remember fasts tests are important, slow tests make you avoid refactoring code!


## TODO

- Tweak `shared_buffers`
- Tweak `work_mem`
