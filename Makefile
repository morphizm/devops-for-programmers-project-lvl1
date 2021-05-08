server:
	npx nodos server

test:
	npm -s test

build:
	docker build -t nodos .

start:
	npx nodos server -h '0.0.0.0'

compose-test:
	docker-compose up --abort-on-container-exit

docker-prod-run:
	docker run -e NODOS_HOST=0.0.0.0 -p 8080:8080 docker.io/morphizm/nodos-prod

build-prod:
	docker build -f Dockerfile.production -t docker.io/morphizm/nodos-prod .
