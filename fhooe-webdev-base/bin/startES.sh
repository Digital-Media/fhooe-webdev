#!/usr/bin/env bash
$ES_HOME/bin/elasticsearch -d -p pid &>/dev/null
sleep 30
netstat -apnt
