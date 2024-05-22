FROM	debian:buster

RUN	apt update -y
RUN	apt upgrade -y
RUN	apt install vim -y
RUN	apt install curl -y
RUN	apt-get install -y php7.3 php-fpm php-mysql mariadb-client
RUN	apt apt-get -y install wget

RUN	wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN	cd /var/www
RUN	tar -xzf wordpress-6.0-fr_FR.tar.gz
RUN	rm wordpress-6.0-fr_FR.tar.gz
RUN	chown -R root:root /var/www/wordpress
