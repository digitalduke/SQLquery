#!/bin/sh

set -e

# dokuwiki_dir=/dokuwiki

# if [ ! -d "$dokuwiki_dir" ]; then
#     echo "DokuWiki does not appear to be installed correctly." >&2
#     exit 1
# fi

chown -R nobody /var/www

su -s /bin/sh nobody -c 'php7 /var/www/bin/indexer.php -c'

exec /usr/bin/supervisord -c /etc/supervisord.conf
