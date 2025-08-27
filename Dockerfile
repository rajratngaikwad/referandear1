FROM php:8.1-apache

# Copy all project files to Apache root
COPY . /var/www/html/

# Expose port 80 for web traffic
EXPOSE 80
