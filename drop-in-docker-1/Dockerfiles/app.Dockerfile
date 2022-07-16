FROM php:8.1.0alpha3-fpm-alpine
# WORKDIR /app
# COPY . .
# ARG UID
RUN apk --update add shadow
# RUN usermod -u $UID www-data && groupmod -g $UID www-data
RUN apk --update add sudo
RUN echo "www-data ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN apk --update add composer
RUN docker-php-ext-install pdo_mysql
RUN apk add --update npm
RUN apk add --update make
ENTRYPOINT php artisan serve --host=0.0.0.0
EXPOSE 8000
