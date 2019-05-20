FROM joaoluiznaufel/base-php7.1:latest

MAINTAINER João Luiz Naufel <joaoluiznaufel@gmail.com>

# Install composer
RUN wget https://getcomposer.org/installer --no-check-certificate
RUN php installer
RUN rm installer
RUN mv ./composer.phar /usr/local/bin/composer

WORKDIR /opt/webapp
EXPOSE 9000
