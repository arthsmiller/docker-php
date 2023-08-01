FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
        libicu-dev \
        curl \
        git \
        unzip \
        nano \
    && docker-php-ext-install \
        pdo_mysql \
        intl \
        opcache \
    && docker-php-ext-enable \
        pdo_mysql \
        intl \
        opcache

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer

RUN curl -sS https://get.symfony.com/cli/installer | bash \
    && mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS="0"
ADD opcache.ini "/usr/local/etc/php/conf.d/opcache.ini"

#RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini && \
#    sed -i 's/short_open_tag=Off' /usr/local/etc/php/php.ini

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && npm -g install yarn

EXPOSE 9000
CMD ["php-fpm"]
