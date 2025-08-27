FROM php:8.1-apache

# Install required Apache modules
RUN apt-get update && apt-get install -y \
    libapache2-mod-php \
 && docker-php-ext-install mysqli pdo pdo_mysql \
 && a2enmod rewrite

# Allow .htaccess overrides in Apache
RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# Copy application files
COPY . /var/www/html/

# Expose port
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
