FROM php:7.1-jessie

RUN apt-get -y update && \
	apt-get -y install git curl zip unzip && \
  	curl -sS https://getcomposer.org/installer | php \
    && chmod +x composer.phar && mv composer.phar /usr/local/bin/composer

RUN apt-get -y install libxml2-dev zlib1g-dev && \
	docker-php-ext-install mbstring soap zip

WORKDIR /app

#COPY composer.json composer.lock ./
#COPY composer.json ./
#RUN composer install --no-scripts --no-autoloader

LABEL maintainer="Fishnux <fishnux@riseup.net>"

CMD echo "Please run \"docker container run --rm -it -v \$(pwd):/app smtpapiphp bash\" to get a shell\nIf this is your first time running this project, you may also need to run \"composer install\" inside the container"

# docker container run --rm -it -v $(pwd):/app smtpapiphp bash