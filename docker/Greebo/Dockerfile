FROM alpine:3.5
MAINTAINER George Pirogov <digitaldule@gmail.com>
LABEL version="greebo"
LABEL description="Docker image with DokuWiki `Greebo`"

ENV VERSION 2018-04-22b
ENV CHECKSUM 605944ec47cd5f822456c54c124df255

RUN apk add --no-cache \
    php7 \
    php7-openssl \
    php7-xml \
    php7-fpm \
    php7-gd \
	php7-session \
	php7-zlib \
    php7-json \
	nginx \
	supervisor \
	curl \
    tar

RUN mkdir -p /run/nginx && \
    mkdir -p /var/www && \
	cd /var/www && \
	curl -L -O "http://download.dokuwiki.org/src/dokuwiki/dokuwiki-$VERSION.tgz" && \
    if [ "$CHECKSUM" != "$(md5sum dokuwiki-$VERSION.tgz | awk '{print($1)}')" ]; then \
    	echo "Wrong md5sum of downloaded file!"; \
    	exit 1; \
	fi && \	
    tar -zxf "dokuwiki-$VERSION.tgz" --strip-components 1 && \
    rm dokuwiki-$VERSION.tgz

ADD nginx.conf /etc/nginx/nginx.conf
ADD supervisord.conf /etc/supervisord.conf
ADD startup.sh /startup.sh

RUN chmod +x /startup.sh && \
	echo "cgi.fix_pathinfo = 0;" >> /etc/php7/php-fpm.ini && \
    sed -i -e "s|;daemonize\s*=\s*yes|daemonize = no|g" /etc/php7/php-fpm.conf && \
    sed -i -e "s|listen\s*=\s*127\.0\.0\.1:9000|listen = /var/run/php-fpm7.sock|g" /etc/php7/php-fpm.d/www.conf && \
    sed -i -e "s|;listen\.owner\s*=\s*|listen.owner = |g" /etc/php7/php-fpm.d/www.conf && \
    sed -i -e "s|;listen\.group\s*=\s*|listen.group = |g" /etc/php7/php-fpm.d/www.conf && \
    sed -i -e "s|;listen\.mode\s*=\s*|listen.mode = |g" /etc/php7/php-fpm.d/www.conf

EXPOSE 80

CMD /startup.sh
