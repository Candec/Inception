
-- Create user for the login, set the password and grant the privilages
CREATE DATABASE IF NOT EXISTS '$MDB_DB_NAME';
CREATE USER IF NOT EXISTS '$MDB_USER_USR'@'%' IDENTIFIED BY '$MDB_USER_PWD';
GRANT ALL PRIVILEGES ON '$MDB_DB_NAME'.* TO '$MDB_USER_USR'@'%';

-- Drop test table
-- DROP TABLE WHERE '%test%'

-- reset to take effect
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MDB_ROOT_PWD';
