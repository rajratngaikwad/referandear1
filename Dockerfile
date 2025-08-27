FROM php:8.2-apache

# Install required extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable Apache rewrite module
RUN a2enmod rewrite

# Copy application files
COPY . /var/www/html/

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html/ \
    && chmod 755 /var/www/html/ \
    && chmod 664 /var/www/html/users.json \
    && chmod 664 /var/www/html/error.log

# Create files if they don't exist
RUN touch /var/www/html/users.json /var/www/html/error.log \
    && chown www-data:www-data /var/www/html/users.json /var/www/html/error.log

# Expose port
EXPOSE 80