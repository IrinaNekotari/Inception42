FROM	debian:buster

RUN	apt update -y 
RUN	apt install php-fpm php-mysql -y
RUN	apt install curl -y

COPY	./tools/launch_wordpress.sh /
COPY	./tools/wp-config.php /

CMD	[ "./launch_wordpress.sh" ]
