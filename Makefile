docker_bash:
	docker compose run --rm controller_poc_server bash

docker_build:
	docker compose build

migrate:
	bundle exec rails db:migrate
