FROM php:8.2

RUN apt-get update \
    && apt-get install -y gnupg tzdata \
    && echo "UTC" > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update && apt-get install -y \
    curl \
    composer \
    git \
    unzip \
    nano
    
RUN curl -sS https://get.symfony.com/cli/installer | bash
