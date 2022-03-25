ARG PHP_VERSION=8.1.1
ARG ENVIRONMENT_MODE="development"
ARG ENVIRONMENT_SUFFIX="-development"

FROM aminlatif/php-nginx:${PHP_VERSION}${ENVIRONMENT_SUFFIX} AS base
ARG NODEJS_VERSION=16
ARG ENVIRONMENT_MODE="development"

USER root:root

RUN ln -snf /usr/share/zoneinfo/Asia/Tehran /etc/localtime && \
    curl -fsSL https://deb.nodesource.com/setup_${NODEJS_VERSION}.x | bash - && \
    apt install -y nodejs
RUN npm install -g sass

FROM base AS production-stage
COPY --chown=www-data:www-data html /var/www/html

FROM base AS development-stage
RUN echo "Development Mode"
RUN apt-get update
RUN apt-get install iputils-ping

FROM ${ENVIRONMENT_MODE}-stage AS final
RUN echo "Final Stage"

USER www-data:www-data