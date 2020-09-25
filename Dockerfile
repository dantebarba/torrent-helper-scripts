FROM alpine

RUN apk install jq curl git crond && git clone https://github.com/Jorman/Scripts.git

WORKDIR /Scripts

COPY cron.sh

RUN chmod +x -R .

CMD /bin/sh
