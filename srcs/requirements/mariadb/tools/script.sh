service mysql start

sed -i "s|127.0.0.1|0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf

mysql -e "CREATE DATABASE $DB_NAME;
		  CREATE USER '$USER'@'%' IDENTIFIED BY '$DB_USER_PASS';
		  GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$USER'@'%';
		  ALTER USER 'root'@'$DOMAIN' IDENTIFIED BY '$DB_ROOT_PASS';
		  FLUSH PRIVILEGES;"

kill $(cat /var/run/mysqld/mysqld.pid)
