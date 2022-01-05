#!/bin/bash

until nc -vz $PGHOST $PGPORT; do 
	echo "Waiting for $PGHOST:$PGPORT"
	sleep 1
done

until pg_isready; do
	echo "Waiting for pg_isready"
	sleep 1
done

until psql -qa -c 'select 1 connected;'; do
	echo "Waiting for successful connection"
	sleep 1
done

exec psql $@
