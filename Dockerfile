FROM php:8.1-apache

# Enable Apache rewrite + headers
RUN a2enmod rewrite headers

# Configure Apache to allow .htaccess
RUN echo '<Directory /var/www/html/>\n\
    AllowOverride All\n\
    Require all granted\n\
</Directory>' > /etc/apache2/conf-available/htaccess.conf \
    && a2enconf htaccess

# Copy project files
COPY . /var/www/html/

WORKDIR /var/www/html/

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
CMD ["apache2-foreground"]
