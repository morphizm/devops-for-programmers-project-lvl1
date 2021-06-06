server:
	npx nodos server

test:
	npm -s test

lint:
	npx eslint .

build:
	docker build -t nodos .

start:
	npx nodos server -h '0.0.0.0'

docker-prod-run:
	docker run -e NODOS_HOST=0.0.0.0 -p 8080:8080 docker.io/morphizm/nodos-prod

build-prod:
	docker build -f Dockerfile.production -t docker.io/morphizm/nodos-prod .

compose-start:
	docker-compose up

compose-bash:
	docker-compose run --rm app bash

compose-build:
	docker-compose build

compose-test:
	docker-compose run app make test

compose-lint:
	docker-compose run app make lint

# $ docker run --rm -i -v /your/path/to/hadolint.yaml:/.config/hadolint.yaml hadolint/hadolint < Dockerfile
hadolint:
	docker run --platform linux/amd64 --rm -i hadolint/hadolint < Dockerfile
