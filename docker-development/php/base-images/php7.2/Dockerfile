FROM php:7.2-fpm-alpine

MAINTAINER Joao Luiz Castro Naufel <joaoluiznaufel@gmail.com>

RUN apk --update --no-cache add wget bash

RUN \
    docker-php-ext-install mysqli pdo pdo_mysql && \
    docker-php-source delete

EXPOSE 9000
