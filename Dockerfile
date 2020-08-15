FROM php:7.4-apache

LABEL maintainer="ivann.laruelle@gmail.com"

ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/

RUN curl -L https://github.com/splitbrain/dokuwiki/archive/release_stable_2020-07-29.tar.gz --output dokuwiki.tar.gz && tar -xf dokuwiki.tar.gz --strip 1 -C /var/www/html && rm dokuwiki.tar.gz && \
    chmod uga+x /usr/local/bin/install-php-extensions && sync && \
    apt-get update && apt-get install -y vim wget zip unzip libcap2-bin rsync nano && \
    install-php-extensions gd ldap pdo_mysql zip intl imagick && \
    apt-get autoremove -y && a2enmod rewrite && \
    chgrp -R 0 /var/www/html && chmod g+rwx -R /var/www/html && setcap 'cap_net_bind_service=+ep' $(which apache2)

EXPOSE 80

COPY dokuwiki-apache.conf /etc/apache2/sites-available/000-default.conf

USER 12500:0



