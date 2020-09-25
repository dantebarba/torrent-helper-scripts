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

ENTRYPOINT ["/cron.sh"]

CMD [""]
