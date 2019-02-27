#!/usr/bin/env bash

eval 'ARGUMENTS="$@"'

case $1 in
    dump)
        TIMESTAMP=$(date --utc +${DATE_FORMAT:-%Y%m%dT%H%M%SZ})
        FILE=${FILE:-~+/${FILE_PREFIX:-rethinkdb_dump}_${TIMESTAMP}.${SUFFIX:-tar.gz}}
        exec rethinkdb $ARGUMENTS --file ${FILE} --temp-dir ${TEMP_DIR:-~+}
        ;;
    *)
        exec rethinkdb ${ARGUMENTS:---help}
        ;;
esac
