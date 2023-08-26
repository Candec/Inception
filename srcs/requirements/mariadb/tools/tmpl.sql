
-- -- Create user for the login, set the password and grant the privilages
-- CREATE DATABASE $WORDPRESS_DB_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;
-- CREATE USER '$MARIADB_USER_NAME'@'%' IDENTIFIED BY '$MARIADB_USER_PASS';
-- GRANT ALL PRIVILEGES ON $WORDPRESS_DB_NAME.* TO '$MARIADB_USER_NAME'@'%';

-- -- Drop test table
-- -- DROP TABLE WHERE '%test%'

-- -- reset to take effect
-- FLUSH PRIVILEGES;
-- UPDATE mysql.user SET password=password('$MARIADB_ROOT_PASS') WHERE user='root';

FLUSH PRIVILEGES;

DELETE FROM	mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASS';

CREATE DATABASE $WORDPRESS_DB_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '$MARIADB_USER_NAME'@'%' IDENTIFIED by '$MARIADB_USER_PASS';
GRANT ALL PRIVILEGES ON $WORDPRESS_DB_NAME.* TO '$MARIADB_USER_NAME'@'%';

FLUSH PRIVILEGES;
