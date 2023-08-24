
-- Create user for the login, set the password and grant the privilages
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS '$MDB_USER_USR'@'%' IDENTIFIED BY '$MDB_USER_PWD';
GRANT ALL PRIVILEGES ON wordpress.* TO '$MDB_USER_USR'@'%';

-- Drop test table
-- DROP TABLE WHERE '%test%'

-- reset to take effect
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
