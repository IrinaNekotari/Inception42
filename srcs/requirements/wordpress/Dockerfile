FROM	debian:buster

RUN	apt update -y 
RUN	apt install -y wget \
	curl \
	bash \
	php \
	php-cgi \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd php-cli \
	php-mbstring \
	redis \
	php-redis \
	&& rm -rf /var/lib/apt/lists/*

COPY	./tools/launch_wordpress.sh /
COPY	./tools/wp-config.php /

CMD	[ "./launch_wordpress.sh" ]
