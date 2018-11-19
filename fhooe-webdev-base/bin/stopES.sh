#!/usr/bin/env bash
kill `cat $ES_HOME/pid`
sleep 30
netstat -apnt
