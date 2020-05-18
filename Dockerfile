FROM php:7.4-apache

# Install Generic Dependencies
RUN apt-get update
RUN apt-get install -y zip unzip libzip-dev libxml2-dev \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip

# Enable Apache Modules
RUN a2enmod rewrite

# Set config files
RUN sed -i 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/000-default.conf \
    && mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" \
    && sed -i 's!;date.timezone =!date.timezone = UTC!g' $PHP_INI_DIR/php.ini

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install beanstalk_console from source
RUN composer create-project ptrofimov/beanstalk_console -s dev .

# Set document root permissions
RUN chown -R www-data:www-data /var/www/html
