FROM postgres:15.1

MAINTAINER dhlparcel

ENV PGDATA /var/lib/postgresql/data
COPY config.sh /docker-entrypoint-initdb.d/

EXPOSE 5432
CMD ["postgres"]