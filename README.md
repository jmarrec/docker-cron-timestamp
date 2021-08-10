# Docker cron with timestamp

[![Docker Test Cron CI](https://github.com/jmarrec/docker-cron-timestamp/actions/workflows/docker-cron-test.yml/badge.svg)](https://github.com/jmarrec/docker-cron-timestamp/actions/workflows/docker-cron-test.yml)

Showcases how to use a docker container to run a cron job every 1 minute to run a python script and do some timestamp logging as well.

All timestamps in UTC (default docker timezone).

## Usage:

There is a Github Actions workflow [docker-cron-test.yml](.github/workflows/docker-cron-test.yml) that shows it in action (Note: I have to pass `-i` only and not `-it` to `docker run` because GHA runners aren't TTY devices).

Locally, you can do:

```
docker image build -t test/cron .
docker run -it --name cron --rm test/cron
```

## Sample output:

```
[2021-08-10T12:15+0000] Running run.py
[2021-08-10T12:15:01.381150+00:00] Python: inside run.py
[2021-08-10T12:15+0000] Done running run.py
[2021-08-10T12:16+0000] Running run.py
[2021-08-10T12:16:01.405802+00:00] Python: inside run.py
[2021-08-10T12:16+0000] Done running run.py
```
