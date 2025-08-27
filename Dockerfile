FROM php:8.1-apache

# enable Apache rewrite module
RUN apt-get update && apt-get install -y \
    libapache2-mod-php \
 && a2enmod rewrite

# allow .htaccess overrides
RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

COPY . /var/www/html/

EXPOSE 80
CMD ["apache2-foreground"]
