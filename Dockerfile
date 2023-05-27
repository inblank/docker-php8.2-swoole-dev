FROM phpswoole/swoole:php8.2-alpine
RUN apk add --no-cache gcc autoconf libc-dev make mc --update linux-headers
RUN pecl install xdebug 
RUN docker-php-ext-enable xdebug
RUN rm -rf /var/cache/apk/*
RUN echo "xdebug.mode=develop,debug" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.log=/var/log/xdebug.log" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.client_host=172.17.0.1" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.client_port=9003" >> /usr/local/etc/php/conf.d/xdebug.ini
