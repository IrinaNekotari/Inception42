FROM	debian:buster

RUN	apt-get update -y
RUN	apt-get upgrade -y
RUN	apt-get install nginx openssl -y

RUN	mkdir -p /etc/nginx/ssl
RUN	openssl req -x509 -nodes -newkey rsa:4096 -sha256 -days 365 \
	-out /etc/nginx/ssl/inception.crt  \
	-keyout /etc/nginx/ssl/inception.key  \
	-subj "/C=FR/ST=IDF/L=Le Havre/O=42/OU=42/CN=nmascrie.42.fr/UID=nmascrie"

RUN		mkdir -p /run/nginx
COPY	conf/nginx.conf /etc/nginx/conf.d

RUN	chmod 755 /var/www/html
RUN	chown -R www-data:www-data /var/www/html

EXPOSE	443

CMD	[ "nginx", "-g", "daemon off;" ]

