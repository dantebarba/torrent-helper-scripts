#!/usr/bin/env sh


sed -i "/qbt_host=/cqbt_host=${QBT_HOST}" /Scripts/AddqBittorrentTrackers.sh;
sed -i "/qbt_port=/cqbt_port=${QBT_PORT}" /Scripts/AddqBittorrentTrackers.sh;
sed -i "/qbt_username=/cqbt_username=${QBT_USERNAME}" /Scripts/AddqBittorrentTrackers.sh;
sed -i "/qbt_password=/cqbt_password=${QBT_PASSWORD}" /Scripts/AddqBittorrentTrackers.sh;
sed -i "/live_trackers_list_url=/clive_trackers_list_url='${TRACKER_LIST_URL}'";

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