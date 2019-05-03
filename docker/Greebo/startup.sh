#!/bin/sh

set -e
chown -R nobody:nobody /var/www
exec /usr/bin/supervisord -c /etc/supervisord.conf
