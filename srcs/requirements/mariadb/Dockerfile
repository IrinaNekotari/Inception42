FROM	debian:buster

RUN	apt-get update -y && apt-get install mariadb-server -y

COPY	./tools/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY	./tools/launch_mariadb.sh /

CMD	["./launch_mariadb.sh"]
