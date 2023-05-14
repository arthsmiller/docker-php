FROM nginx:latest

RUN apt-get update && apt-get install -y software-properties-common

RUN add-apt-repository ppa:certbot/certbot

RUN apt-get update -y && apt-get install -y certbot python-certbot-nginx
