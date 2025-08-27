FROM php:8.1-apache

# enable apache rewrite
RUN a2enmod rewrite

COPY . /var/www/html/

EXPOSE 80
