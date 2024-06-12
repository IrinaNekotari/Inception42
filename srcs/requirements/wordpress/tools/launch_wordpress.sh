#!/bin/bash

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
sed -i 's|PHP_PORT|9000|g' /etc/php/7.3/fpm/pool.d/www.conf

mkdir /var/
mkdir /var/www/
mkdir /var/www/html
chmod 777 -R /var/www/html/

cd /var/www/html
rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar 
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root --path='/var/www/html'
wp config create --allow-root --path='/var/www/html' --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb --skip-check
wp core install --allow-root --path='/var/www/html' --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
wp user create --allow-root --path='/var/www/html' ${WP_USER_NAME} ${WP_USER_MAIL} --user_pass=${WP_USER_PASS}
wp theme install blocksy --activate --allow-root
	

mkdir /run/php

/usr/sbin/php-fpm7.3 -F
