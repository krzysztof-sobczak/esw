DOCKER_RUN_API_ONLY = docker-compose run --rm --no-deps -e ELASTICSEARCH_URL='' app
DOCKER_RUN_TESTS = docker-compose run --rm -e ENVIRONMENT='testing' app
DOCKER_MACHINE="default"

solve: pyclean
	$(DOCKER_RUN_TESTS) behave -v --format=json.pretty --color --junit --outfile=build/behave-results.json

init: stop solve kibana

build: .
	docker-compose build

pyclean: build
	$(DOCKER_RUN_API_ONLY) find . -name "*.pyc" -delete

kibana:
	docker-compose up -d kibana

stop:
	docker-compose down -v --remove-orphans

setup-docker-machine:
	docker-machine ssh $(DOCKER_MACHINE) sudo sysctl -w vm.max_map_count=262144