
-- Create user for the login, set the password and grant the privilages
CREATE DATABASE IF NOT EXISTS '$WORDPRESS_DB_NAME';
CREATE USER IF NOT EXISTS '$MARIADB_USER_NAME'@'%' IDENTIFIED BY '$MARIADB_USER_PASS';
GRANT ALL PRIVILEGES ON '$WORDPRESS_DB_NAME'.* TO '$MARIADB_USER_NAME'@'%';

-- Drop test table
-- DROP TABLE WHERE '%test%'

-- reset to take effect
FLUSH PRIVILEGES;
UPDATE mysql.user SET password=password('$MARIADB_ROOT_PASS') WHERE user='root';
