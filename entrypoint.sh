#!/bin/bash

until nc -vz $PGHOST $PGPORT; do 
	echo "Waiting for $PGHOST:$PGPORT"
	sleep 1
done

until pg_isready; do
	echo "Waiting for pg_isready"
done
sleep 5
