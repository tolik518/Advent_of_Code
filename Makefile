USER=$(shell whoami)
UID=$(shell id -u $(USER))
year=$$(date +"%Y")
day=$$(date +"%d")

.PHONY: build_image
build_image:
	docker build -f docker/ruby/Dockerfile . -t advent_of_code/ruby:dev --build-arg uid=$(UID) --build-arg user=$(USER)

.PHONY: run
run:
	year=$(year) day=$(day) part=$(part) docker-compose -f docker/ruby/docker-compose.yml up

.PHONY: get_readme
get_readme:
	docker-compose -f docker/ruby/docker-compose.yml run --rm --no-deps --entrypoint="ruby /scripts/get_readme.rb" ruby

.PHONY: stop
stop:
	docker-compose -f docker/ruby/docker-compose.yml down --remove-orphans
