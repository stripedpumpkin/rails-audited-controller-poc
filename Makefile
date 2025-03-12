docker_bash:
	docker compose run --rm controller_poc_server bash

docker_build:
	docker compose build

migration:
	bundle exec rails db:migrate
