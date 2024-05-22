FROM	debian:buster

RUN	apt update -y
RUN	apt upgrade -y
RUN	apt install mariadb-server -y
RUN	apt install vim -y
RUN	apt install curl -y

EXPOSE	3306

COPY	conf/mariadb.conf /etc/mariadb.conf.d/50-server.cnf
COPY	tools/script.sh /usr/local/bin

RUN	chmod 755 /etc/mariadb.conf.d/50-server.cnf
RUN	chmod 755 /usr/local/bin/script.sh

ENTRYPOINT [ "/usr/local/bin/script.sh" ]

CMD	["mysqld", "--bind-address=0.0.0.0"]

