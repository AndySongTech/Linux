#!/bin/bash
yum install httpd php php-mysql -y
cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz     #unzip file name is wordpress folder
cp -r wordpress/* var/www/html/
rm -rf wordpress
rm -rf  latest.tar.gz
chmod -R 775 wp-content 
chown -R apache:apache wp-content
chconfig httpd on
service httpd start
