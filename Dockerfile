FROM ubuntu:16.04
RUN apt-get update -y\
    && apt-get upgrade -y\
    && apt-get install git -y\
    && export DEBIAN_FRONTEND=noninteractive \
    && apt install apache2 -y \
    && apt install apt-utils -y \
    && apt install mysql-server -y \
    && apt install php -y \
    && apt -y -qq install php libapache2-mod-php php-mysql \
    && service mysql start \
    && echo "ALTER USER 'root'@'localhost' IDENTIFIED WITH 'mysql_native_password' BY 'root';FLUSH PRIVILEGES;" > file.txt \
    && mysql -u root < file.txt \
    && apt install phpmyadmin -y \
    && echo "Include /etc/phpmyadmin/apache.conf \n ServerName localhost" >> /etc/apache2/apache2.conf \
    && chmod -R 755 /var/lib/mysql/ \
    && touch /var/run/mysqld/mysqld.sock \
    && chown -R mysql /var/run/mysqld \
    && git clone https://github.com/ybenbrai/apache_runner.git \
    && mv apache_runner/run.sh .. \
    && rm -f /var/www/html/index.html \
    && sed -i '2 i AllowOverride All' /etc/apache2/sites-available/000-default.conf \
    && a2enmod rewrite\
    && rm -f /etc/apache2/apache2.conf \
    && mv apache_runner/apache2.conf /etc/apache2/ \
    && service apache2 restart \
    && apt-get update -y \
    && apt-get upgrade -y
