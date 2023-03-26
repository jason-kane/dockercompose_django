build:
	sudo chown -R ${USER} .
	# docker build -t moviemagic:latest .
	docker compose build 

shell:
	docker run --mount type=bind,source="${PWD}",target=/app -it --rm moviemagic:latest /bin/bash

fix:
	sudo chown -R ${USER} .
	sudo chown -R root data

start: fix
	docker compose up

logs:
	docker compose logs -f