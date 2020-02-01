FROM alpine

RUN apk add --no-cache jq curl

COPY /start.sh /
RUN ["chmod", "+x", "/start.sh"]

COPY /reboot.sh /
RUN ["chmod", "+x", "/reboot.sh"]

CMD ["./start.sh"]