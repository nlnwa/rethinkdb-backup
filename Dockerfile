FROM rethinkdb:2.3.5

LABEL maintainer="marius.beck@nb.no"

RUN rm /etc/apt/sources.list.d/rethinkdb.list && \
    apt-get update && \
    apt-get -y install python-pip && \
    rm -rf /var/lib/apt/lists/* && \
    pip install rethinkdb==2.3.0.post6

COPY docker-entrypoint.sh /usr/local/bin

USER rethinkdb

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["--help"]
