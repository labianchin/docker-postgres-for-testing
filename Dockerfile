FROM postgres:9.4

MAINTAINER labianchin

ENV PGDATA /var/lib/postgresql/data
COPY config.sh /docker-entrypoint-initdb.d/

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5432
CMD ["postgres"]