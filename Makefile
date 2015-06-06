NAME=yaafe-docker

build:
	docker build -t $(NAME) .

run:
	docker run -it --rm=true $(NAME) bash

remove:
	-docker stop $(NAME)
	-docker rm $(NAME)