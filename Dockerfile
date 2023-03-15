FROM rethinkdb:2.4.2-bullseye-slim

LABEL maintainer="marius.beck@nb.no"

RUN apt-get update && \
    apt-get -y install python3-pip && \
    rm -rf /var/lib/apt/lists/*

RUN pip install rethinkdb

COPY docker-entrypoint.sh /usr/local/bin

USER rethinkdb

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["--help"]
