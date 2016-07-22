FROM ubuntu:14.04
MAINTAINER  TuyenNT  <nttuyen266@gmail.com>

RUN apt-get update
RUN apt-get -y install vim
RUN apt-get -y install telnet
RUN apt-get -y install mysql-client
RUN apt-get -y --force-yes install apache2
RUN apt-get -y --force-yes install php5 libapache2-mod-php5 php5-mcrypt php5-cgi php5-cli php5-common php5-curl php5-dev php5-gd php5-mysql php5-xdebug php5-memcached
RUN a2enmod rewrite
RUN echo 'xdebug.remote_autostart=0' >> /etc/php5/mods-available/xdebug.ini
RUN echo 'xdebug.remote_enable=1' >> /etc/php5/mods-available/xdebug.ini
RUN echo 'xdebug.remote_connect_back=1' >> /etc/php5/mods-available/xdebug.ini

COPY apache2-foreground /usr/local/bin/
RUN chmod a+x /usr/local/bin/apache2-foreground
WORKDIR /var/www/html

VOLUME ["/var/www/html"]
EXPOSE 80

CMD ["apache2-foreground"]