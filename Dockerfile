FROM alpine:3.4
MAINTAINER Emil Nilsson <eonilsson@gmail.com>

RUN apk --update add supervisor

ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]

