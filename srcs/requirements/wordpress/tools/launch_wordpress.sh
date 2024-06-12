#!/bin/bash
mkdir /var/www/
mkdir /var/www/html

cd /var/www/html
rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar 
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root
mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
mv /wp-config.php /var/www/html/wp-config.php

chmod 777 -R /var/www/html/

sed -i -r "s/db1/$SQL_DATABASE/1"   wp-config.php
sed -i -r "s/user/$SQL_USER/1"  wp-config.php
sed -i -r "s/pwd/$SQL_PASSWORD/1"    wp-config.php

wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

wp theme install blocksy --activate --allow-root
wp plugin install redis-cache --activate --allow-root
wp plugin update --all --allow-root

wp user create $WP_USER_NAME $WP_USER_MAIL --user_pass=$WP_USER_PASS --display_name=$WP_USER_NICK --role=author --allow-root

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

mkdir /run/php

wp redis enable --allow-root

/usr/sbin/php-fpm7.3 -F