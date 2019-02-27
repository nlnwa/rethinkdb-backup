#!/usr/bin/env bash

eval 'ARGUMENTS="$@"'

case $1 in
    dump)
        TEMP_DIR=${TEMP_DIR:-$(pwd)}
        DATE_FORMAT=${DATE_FORMAT:-%Y%m%dT%H%M%SZ}
        TIMESTAMP=$(date --utc +${DATE_FORMAT})
        FILE_SUFFIX=${FILE_SUFFIX:-tar.gz}
        FILE_PREFIX=${FILE_PREFIX:-rethinkdb_dump}
        FILE=${FILE:-$(pwd)/${FILE_PREFIX}_${TIMESTAMP}.${FILE_SUFFIX}}

        exec rethinkdb ${ARGUMENTS:---help} --file ${FILE} --temp-dir ${TEMP_DIR}
        ;;
    *)
        exec rethinkdb ${ARGUMENTS:---help}
        ;;
esac
