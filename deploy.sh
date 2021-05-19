#!/bin/bash
if [ ! -f /var/www/html/.htaccess.dist ]; then
    rsync -aOr /tmp/dokuwiki/ /var/www/html/
fi
if [ ! -f /var/www/html/conf/.htaccess ]; then
    rsync -aOr /tmp/dokuwiki/conf/ /var/www/html/conf/
fi
if [ ! -f /var/www/html/data/.htaccess ]; then
    rsync -aOr /tmp/dokuwiki/data/ /var/www/html/data/
fi
if [ ! -f /var/www/html/lib/index.html ]; then
    rsync -aOr /tmp/dokuwiki/lib/ /var/www/html/lib
fi
