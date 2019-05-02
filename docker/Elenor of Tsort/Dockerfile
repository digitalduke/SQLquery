FROM alpine:3.5
MAINTAINER George Pirogov <digitaldule@gmail.com>
LABEL version="elenor"
LABEL description="Docker image with DokuWiki `Elenor of Tsort`"

ENV VERSION 2016-06-26e
ENV CHECKSUM f83d0c0d5e6ec2f8a765bb710f068720

RUN apk --update upgrade --no-cache; \
	apk add --no-cache \
    php7 \
    php7-openssl \
    php7-xml \
    php7-fpm \
    php7-gd \
    php7-ldap \
	php7-session \
	nginx \
	supervisor \
	curl \
    tar

RUN mkdir -p /run/nginx && \
    mkdir -p /var/www

RUN cd /var/www && \
	curl -L -O "http://download.dokuwiki.org/src/dokuwiki/dokuwiki-$VERSION.tgz" && \
    if [ "$CHECKSUM" != "$(md5sum dokuwiki-$VERSION.tgz | awk '{print($1)}')" ]; then \
    	echo "Wrong md5sum of downloaded file!"; \
    	exit 1; \
	fi && \	
    tar -zxf "dokuwiki-$VERSION.tgz" --strip-components 1

ADD nginx.conf /etc/nginx/nginx.conf
ADD supervisord.conf /etc/supervisord.conf
ADD startup.sh /startup.sh

RUN chmod +x /startup.sh
RUN echo "cgi.fix_pathinfo = 0;" >> /etc/php7/php-fpm.ini && \
    sed -i -e "s|;daemonize\s*=\s*yes|daemonize = no|g" /etc/php7/php-fpm.conf && \
    sed -i -e "s|listen\s*=\s*127\.0\.0\.1:9000|listen = /var/run/php-fpm7.sock|g" /etc/php7/php-fpm.d/www.conf && \
    sed -i -e "s|;listen\.owner\s*=\s*|listen.owner = |g" /etc/php7/php-fpm.d/www.conf && \
    sed -i -e "s|;listen\.group\s*=\s*|listen.group = |g" /etc/php7/php-fpm.d/www.conf && \
    sed -i -e "s|;listen\.mode\s*=\s*|listen.mode = |g" /etc/php7/php-fpm.d/www.conf

EXPOSE 80

CMD /startup.sh
