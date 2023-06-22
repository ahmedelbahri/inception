# RUN mkdir -p /run/php/

sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 9000|g" /etc/php/7.4/fpm/pool.d/www.conf

curl -O wordpress https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wordpress

mv wordpress /usr/local/bin/wordpress

wp core download --allow-root --path=/var/www/html

wp config create --allow-root \
				 --path=/var/www/html \
				 --dbname=$DB_NAME \
				 --dbuser=$USER \
				 --dbpass=$DB_PASS \
				 --dbhost=$DB_HOST

wp core install --allow-root \
				--path=/var/www/html \
				--url=$DOMAIN \
				--title=$WP_TITLE \
				--admin_user=$WP_ADMIN \
				--admin_password=$WP_ADMIN_PASS \
				--admin_email=$WP_ADMIN_EMAIL

# define( 'WP_DEBUG', true );

# define( 'WP_DEBUG_LOG', true );

# define( 'WP_DEBUG_DISPLAY', false );

# define( 'WP_MEMORY_LIMIT', '256M' );

# define( 'WP_MAX_MEMORY_LIMIT', '512M' );

# define( 'WP_POST_REVISIONS', 3 );

# define( 'WP_AUTO_UPDATE_CORE', false );

# define( 'DISALLOW_FILE_EDIT', true );

# define( 'FS_METHOD', 'direct' );

# define( 'WP_HOME', 'http://$DOMAIN' );

# define( 'WP_SITEURL', 'http://$DOMAIN' );

# PHP

# wp user create --allow-root --path=/var/www/html $USER $USER@$DOMAIN --user_pass=$USER_PASS --role=author

# wp user create --allow-root --path=/var/www/html $ADMIN_USER $ADMIN_EMAIL --user_pass=$ADMIN_PASS --role=administrator

# wp plugin install --allow-root --path=/var/www/html akismet

# wp plugin install --allow-root --path=/var/www/html hello

# wp plugin install --allow-root --path=/var/www/html jetpack

# wp plugin install --allow-root --path=/var/www/html wordpress-importer

# wp plugin install --allow-root --path=/var/www/html wp-multibyte-patch

# wp plugin install --allow-root --path=/var/www/html wp-super-cache

# wp plugin install --allow-root --path=/var/www/html wpforms-lite

# wp plugin install --allow-root --path=/var/www/html wp-mail-smtp

# wp plugin install --allow-root --path=/var/www/html wp-optimize

# wp plugin install --allow-root --path=/var/www/html wp-smushit