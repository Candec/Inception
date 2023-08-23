#!bin/sh

# Checks if mysql is running by cheking if there is a database called mysql
if [ ! -d "/var/lib/mysql/mysql" ]; then

        # Gives the own rights to mysql group
        chown -R mysql:mysql /var/lib/mysql

        # init database
        mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm

        # Checks if mktemp directory exists
        tfile=`mktemp`
        if [ ! -f "$tfile" ]; then
                return 1
        fi
fi

# Checks if there is a wordpress database, and creates it in case it doesn't.
# It also add the users root and {user} to the wordpress DB group
if [ ! -d "/var/lib/mysql/wordpress" ]; then

        cat << EOF > /tmp/create_db.sql
USE mysql;
FLUSH PRIVILEGES;
DELETE FROM mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
CREATE DATABASE IF NOT EXISTS ${DB_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci ;

CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' WITH GRANT OPTION;
#DROP TABLE WHERE '%test%'
-- set root password
UPDATE mysql.user SET password=password('$DB_ROOT') WHERE user='root';

FLUSH PRIVILEGES;
EOF
        # run init.sql
        /usr/bin/mysqld --user=mysql --bootstrap < /tmp/create_db.sql
        rm -f /tmp/create_db.sql
fi
