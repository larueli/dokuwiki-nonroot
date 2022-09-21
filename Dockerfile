FROM larueli/php-base-image:8.1

ARG DOKUWIKI_VERSION=release_stable_2022-07-31a
ENV DOKUWIKI_VERSION=${DOKUWIKI_VERSION}

COPY deploy.sh /docker-entrypoint-init.d/

USER 0

RUN curl -L https://github.com/splitbrain/dokuwiki/archive/refs/tags/${DOKUWIKI_VERSION}.tar.gz --output /tmp/dokuwiki.tar.gz && \
    mkdir /tmp/dokuwiki && tar -xf /tmp/dokuwiki.tar.gz --strip 1 -C /tmp/dokuwiki && rsync -aOr /tmp/dokuwiki/ /var/www/html/ && \
    cp /var/www/html/.htaccess.dist /var/www/html/.htaccess && chgrp -R 0 /var/www/html && chmod g+rwx -R /var/www/html

USER 12500:0
