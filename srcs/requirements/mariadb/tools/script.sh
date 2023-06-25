mysql_install_db

service mariadb start

sed -i "s|127.0.0.1|0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf

mysql -e "CREATE DATABASE $DB_NAME;
		  CREATE USER '$USER'@'%' IDENTIFIED BY '$DB_USER_PASS';
		  GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$USER'@'%';
		  FLUSH PRIVILEGES;"

mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS';"

kill `cat /var/run/mysqld/mysqld.pid`

mysqld
