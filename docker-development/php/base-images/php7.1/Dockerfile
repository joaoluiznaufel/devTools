FROM php:7.1-fpm-alpine

MAINTAINER Joao Luiz Castro Naufel <joaoluiznaufel@gmail.com>

RUN apk --update --no-cache add wget bash \
        libmcrypt-dev \
        zlib-dev \
        icu-dev \
        libbsd \
        autoconf \
        gcc \
        g++ \
        make \
        libffi-dev \
        openssl-dev

RUN \
    docker-php-ext-configure opcache && \
    docker-php-ext-configure mcrypt && \
    docker-php-ext-configure intl && \
    docker-php-ext-configure zip

RUN \
    pecl install mongodb-1.5.5 && \
    pecl install xdebug-2.5.5 \
    pecl clear-cache

RUN \
    docker-php-ext-install opcache mcrypt zip intl && \
    docker-php-ext-enable mongodb.so && \
    docker-php-source delete

EXPOSE 9000
