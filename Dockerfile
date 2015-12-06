FROM alpine:3.2
MAINTAINER Emil Nilsson <eonilsson@gmail.com>

ENV PYTHON_VERSION=2.7.10-r1
ENV PY_PIP_VERSION=6.1.1-r0
ENV SUPERVISOR_VERSION=3.2.0

RUN apk update && apk add -u python=$PYTHON_VERSION py-pip=$PY_PIP_VERSION
RUN pip install supervisor==$SUPERVISOR_VERSION

ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]

