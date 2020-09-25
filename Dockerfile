FROM alpine

RUN apk --no-cache add ca-certificates jq curl git crond dcron tzdata && git clone https://github.com/Jorman/Scripts.git

WORKDIR /Scripts

COPY cron.sh .

RUN chmod +x -R .

RUN touch /var/log/crond.log

ENV CRON='* * * * *'
ENV CMD='echo Running Script'
ENV OPTS=''

CMD /bin/sh
