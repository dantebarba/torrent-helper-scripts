FROM alpine

RUN apk --no-cache add ca-certificates jq curl git dcron dcron tzdata && git clone https://github.com/Jorman/Scripts.git

COPY cron.sh /cron.sh

RUN chmod +x -R /cron.sh

WORKDIR /Scripts

RUN chmod +x -R /Scripts

RUN touch /var/log/crond.log

ENV CRON='* * * * *'
ENV CMD='echo Running Script'
ENV OPTS=''

ENV QBT_HOST='http://qbittorrent'
ENV QBT_USERNAME='admin'
ENV QBT_PASSWORD='adminadmin'
ENV QBT_PORT='8080'

ENTRYPOINT ["/cron.sh"]

CMD [""]
