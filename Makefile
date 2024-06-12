# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nmascrie <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/19 14:01:23 by nmascrie          #+#    #+#              #
#    Updated: 2023/12/19 14:01:24 by nmascrie         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	mkdir -p /home/nmascrie/data/wordpress /home/nmascrie/data/mysql
	@docker-compose -f ./srcs/docker-compose.yml up -d --build
	
down:
	@docker compose -f ./srcs/docker-compose.yml down
	
re:
	@docker compose -f ./srcs/docker-compose.yml down
	@docker compose -f ./srcs/docker-compose.yml up -d --build

clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\
	rm -rf /home/nmascrie/data/mysql
	rm -rf /home/nmascrie/data/wordpress 

.PHONY: all clean down re
