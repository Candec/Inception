#!/bin/bash
if [! -d "/home/${USER}/data" ]; then
        mkdir ~/Inception/data
        mkdir ~/Inception/data/mariadb
        mkdir ~/Inception/data/wordpress
fi
