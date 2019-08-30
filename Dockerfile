FROM sxe79/php:latest

RUN apt-get update \
 && apt-get install -y libzip-dev \
 && docker-php-ext-install mysqli \
 && docker-php-ext-install pdo \
 && docker-php-ext-install pdo_mysql \
 && docker-php-ext-install zip
 #&& docker-php-ext-configure intl \
 #&& docker-php-ext-install intl

#USER root

RUN echo 'Downloading Joomla Nightly build...' \
 && wget -O joomla_4_test-full_package.zip https://developer.joomla.org/nightlies/Joomla_4.0.0-alpha12-dev-Development-Full_Package.zip \
 && unzip joomla_4_test-full_package.zip \
 && rm joomla_4_test-full_package.zip \
 && chown -R www-data:www-data /var/www/html