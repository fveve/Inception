set -e

service mysql start

mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;" 

mysql -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';" 

mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%';" 

mysql -e "ALTER USER 'root'@'arafa.42.fr' IDENTIFIED BY '${DB_PASSWORD}';" 

mysql -e "FLUSH PRIVILEGES;"
