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
	@docker compose -f ./srcs/docker-compose.yml up -d --build
	
down:
	@docker compose -f ./srcs/docker-compose.yml down
	
re:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

clean:
	@docker stop $$(docker ps -qa); \
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -qa);\
	docker network rm $$(docker network ls -qa);

.PHONY: all clean down re
