
-- Create user for the login, set the password and grant the privilages
CREATE USER IF NOT EXISTS '$MDB_USER_USR'@'%' IDENTIFIED BY '$MDB_USER_PWD';
GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$MDB_USER_USR'@'%' WITH GRANT OPTION;

-- Drop test table
#DROP TABLE WHERE '%test%'

-- set root password
UPDATE mysql.user SET password=password('$MDB_ROOT_PWD') WHERE user='root';

-- reset to take effect
FLUSH PRIVILEGES;
