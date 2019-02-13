FROM rethinkdb:2.3.5

LABEL maintainer="marius.beck@nb.no"

RUN apt-get update && \
    apt-get -y install python-pip && \
    rm -rf /var/lib/apt/lists/* && \
    pip install rethinkdb

USER rethinkdb

ENTRYPOINT ["rethinkdb"]
CMD ["--help"]
