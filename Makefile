.PHONY: build_image
build_image:
	docker build -f docker/ruby/Dockerfile . -t advent_of_code/ruby:dev

.PHONY: run
run:
	year=$(year) day=$(day) part=$(part) docker-compose -f docker/ruby/docker-compose.yml up

.PHONY: stop
stop:
	docker-compose -f docker/ruby/docker-compose.yml down --remove-orphans
