#!/bin/bash

set -e

if [ "$@" != "logstash" ]; then
	exec "$@"
fi

stop(){
	/etc/init.d/logstash stop
	pkill tail
}

trap stop SIGINT SIGTERM
/etc/init.d/logstash start
tail -f /var/log/logstash/* &
wait

