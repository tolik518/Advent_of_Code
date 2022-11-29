# Advent of Code

This repository will contain my solution-attempts for the [Advent of Code](https://adventofcode.com/).

The repository is fully dockerized, so you only need [Docker](https://www.docker.com/)/[Docker-Compose](https://docs.docker.com/compose/install/) and Make to execute the code. No need to install Ruby locally - only if you want to run the code without docker.

First you need to build the docker image with
```sh
make build_image
```

To run a specific part, just execute
```sh
make run year=2021 day=01 part=1
```

If you want to run the scripts without the Docker overhead then you'd need to install the [Gemfile](docker/ruby/Gemfile) in the `docker/ruby`-folder first before executing the files.
