
-- Create user for the login, set the password and grant the privilages
CREATE DATABASE $WORDPRESS_DB_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '$MARIADB_USER_NAME'@'%' IDENTIFIED BY '$MARIADB_USER_PASS';
GRANT ALL PRIVILEGES ON $WORDPRESS_DB_NAME.* TO '$MARIADB_USER_NAME'@'%';

-- Drop test table
-- DROP TABLE WHERE '%test%'

-- reset to take effect
FLUSH PRIVILEGES;
UPDATE mysql.user SET password=password('$MARIADB_ROOT_PASS') WHERE user='root';
