#!/usr/bin/env bash

if [ -z "$CRON" ]
  then
    echo "INFO: No CRON setting found. Running autoremove once."
    $CMD $OPTS
  else
    # Setup cron schedule
    crontab -d
    echo "$CRON $CMD $OPTS >> /var/log/crond.log 2>&1" > /tmp/crontab.tmp
    crontab /tmp/crontab.tmp
    crontab -l
    rm /tmp/crontab.tmp
    # Start cron
    echo "INFO: Starting cron ..."
    touch /var/log/crond.log
    crond -b -l 0 -L /var/log/crond.log
    echo "INFO: cron started"
    tail -F /var/log/crond.log
  fi
fi