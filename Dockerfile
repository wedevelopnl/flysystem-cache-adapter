# Dockerfile to build image for development and testing
FROM php:8.2-cli-alpine

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && sync

RUN apk add --no-cache bash 

RUN install-php-extensions \
    opcache \
    redis \
    igbinary \
    xdebug \
    @composer-2

WORKDIR /app