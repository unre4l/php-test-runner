FROM alpine:edge

RUN apk --update add wget \
		     curl \
		     git \
		     openssh \
		     mysql-client \
		     php8 \
		     php8-curl \
		     php8-openssl \
		     php8-iconv \
		     php8-mbstring \
		     php8-phar \
		     php8-pdo_mysql \
		     php8-bcmath \
		     php8-ctype \
		     php8-fileinfo \
		     php8-tokenizer \
		     php8-xml \
		     php8-dom \
		     php8-simplexml

RUN ln -s /usr/bin/php8 /usr/bin/php

ENV COMPOSER_HOME=/usr/config/composer
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN touch /etc/ssh/ssh_known_hosts && \
    ssh-keyscan github.com >> /etc/ssh/ssh_known_hosts

RUN mkdir -p /var/www

WORKDIR /var/www
