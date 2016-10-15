#!/bin/sh

# USAGE : $0 [dbname] [max-rows]

PGDATABASE="carpool"
if [[ "X$1" != "X" ]]
then
PGDATABASE=$1
fi

LIMIT="LIMIT 25"
if [[ "X$2" != "X" ]]
then
LIMIT="LIMIT $2"
fi

echo $PGDATABASE $LIMIT

psql -h /tmp $PGDATABASE <<RPT
select * from stage.vw_ride_request order by last_updated_ts desc $LIMIT
RPT


