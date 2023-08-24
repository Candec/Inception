#!bin/sh

# Checks if mysql is running by cheking if there is a database called mysql
if [ ! -d "/var/lib/mysql/mysql" ]; then

        # Gives the own rights to mysql group
        chown -R mysql:mysql /var/lib/mysql

        # init database
        mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm

fi

cat tmpl.sql | envsubst > /tmp/create_db.sql
