FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
        libicu-dev \
    && docker-php-ext-install \
        intl \
        opcache \
    && docker-php-ext-enable \
        intl \
        opcache

RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    nano

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer

RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | bash \
    && apt-get install -y symfony-cli
    
RUN symfony new app --version="6.2.*" --webapp

ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS="0"
ADD opcache.ini "$PHP_INI_DIR/conf.d/opcache.ini"

RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini && \
    sed -i 's/upload_max_filesize = 20M/upload_max_filesize = 128M/g' /usr/local/etc/php/php.ini && \
    sed -i 's/whatever_option = 1234/whatever_option = 4321/g' /usr/local/etc/php/php.ini

EXPOSE 9000
CMD ["php-fpm"]
