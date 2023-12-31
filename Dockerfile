FROM php:8.1-fpm-alpine


COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /app
COPY . .
RUN composer install
RUN php artisan key:generate
CMD php artisan serve --host=0.0.0.0 --port=80
