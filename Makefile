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
	@docker-compose -f ./srcs/docker-compose.yml up -d --build
	
down:
	@docker compose -f ./srcs/docker-compose.yml down
	
re:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

clean:
	@docker compose -f ./srcs/docker-compose.yml down
	@docker rm nginx
	@docker rm mariadb
	@docker rm wordpress

.PHONY: all clean down re
