FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y gnupg tzdata \
    && echo "UTC" > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update && apt-get install -y \
    software-properties-common \
    curl \
    && add-apt-repository -y ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y \
    php8.2 \
    php8.2-fpm \
    php8.2-mysql \
    php8.2-mbstring \
    php8.2-xml \
    php8.2-curl \
    php8.2-gd \
    php8.2-zip \
    composer \
    git \
    unzip \
    nano \
    nginx
    
RUN curl -sS https://get.symfony.com/cli/installer | bash
#RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | bash && apt install symfony-cli

COPY --link nginx/arthsdev.conf /etc/nginx/conf.d/arthsdev.conf

EXPOSE 80;

ENTRYPOINT service php8.2-fpm start && /bin/bash
#CMD service php8.2-fpm start
