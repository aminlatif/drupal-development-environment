ARG MYSQL_VERSION="latest"

FROM mysql:${MYSQL_VERSION} AS base
ARG TIMEZONE="UTC"

RUN echo ${TIMEZONE}
RUN ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime