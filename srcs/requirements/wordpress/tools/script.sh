sleep 10

mkdir /run/php

sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 9000|g" /etc/php/7.4/fpm/pool.d/www.conf

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

cd /var/www/html

wp core download --path=/var/www/html --allow-root

cp wp-config-sample.php wp-config.php

sed -i "s/'DB_NAME', '.*'/'DB_NAME', '$DB_NAME'/" wp-config.php
sed -i "s/'DB_USER', '.*'/'DB_USER', '$USER'/" wp-config.php
sed -i "s/'DB_PASSWORD', '.*'/'DB_PASSWORD', '$DB_USER_PASS'/" wp-config.php
sed -i "s/'DB_HOST', '.*'/'DB_HOST', '$DB_HOST'/" wp-config.php

wp core install --allow-root \
				--url=$DOMAIN \
				--title=$WP_TITLE \
				--admin_user=$USER \
				--admin_password=$WP_ADMIN_PASS \
				--admin_email=$WP_ADMIN_EMAIL

wp user create $WP_USER $WP_USER_EMAIL --user_pass=userpassword \
			   --role=author \
			   --allow-root

wp config set WP_CACHE 'true' --allow-root

wp config set WP_REDIS_HOST $REDIS_HOST --allow-root

wp config set WP_REDIS_PORT $REDIS_PORT --allow-root

wp plugin install redis-cache --activate --allow-root

wp redis enable --allow-root

/usr/sbin/php-fpm7.4 -F
