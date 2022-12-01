# Advent of Code

This repository will contain my solution-attempts for the [Advent of Code](https://adventofcode.com/).

The repository is fully dockerized, so you only need [Docker](https://www.docker.com/)/[Docker-Compose](https://docs.docker.com/compose/install/) and Make to execute the code. No need to install Ruby locally - only if you want to run the code without docker.


First you need to build the docker image with
```sh
make build_image
```

To initialize this days readme and input, just execute
```sh
make init
```

To execute this days solution, just execute
```sh
make run
```

To run a specific day, just execute
```sh
make run year=2022 day=01
```

If you want to run the scripts without the Docker overhead then you'd need to install the [Gemfile](docker/ruby/Gemfile) in the `docker/ruby`-folder first before executing the files.

Tip: Use `git update-index --assume-unchanged .env` to ignore changes to the `.env`-file
