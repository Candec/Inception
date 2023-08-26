-- https://mariadb.com/kb/en/

-- create `LOGIN` user, change password and grant privileges to wordpress database
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' WITH GRANT OPTION;

-- set root password
UPDATE mysql.user SET password=password('$DB_ROOT') WHERE user='$DB_UROOT';

-- reset to take effect
FLUSH PRIVILEGES;
