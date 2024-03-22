FROM php:8.1-fpm
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    curl \
    git \
    libpq-dev \
    libpng-dev \
    libonig-dev \
    zlib1g-dev \
    libzip-dev \
    zip \
  && docker-php-ext-install bcmath mbstring \
  && curl https://packages.microsoft.com/keys/microsoft.asc | tee /etc/apt/trusted.gpg.d/microsoft.asc \
  && curl https://packages.microsoft.com/config/debian/11/prod.list | tee /etc/apt/sources.list.d/mssql-release.list \
  && apt-get update \
  && ACCEPT_EULA=Y apt-get install -y msodbcsql17 unixodbc-dev \
  && pecl install sqlsrv pdo_sqlsrv \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-install zip

COPY mssql.ini /usr/local/etc/php/conf.d

# Composer install
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV PATH $PATH:/composer/vendor/bin
