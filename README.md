# Running Beanstalkd UI a.k.a Beanstalkd Console

This is a Dockerized version for [Beanstalkd Console](https://github.com/ptrofimov/beanstalk_console) project.

## Public Docker Images

Public Docker images are available here: https://hub.docker.com/r/thedavis/beanstalkd-ui  

## Building

To build a fresh container, run the following command, substituting whatever tag you would like to give the resulting image.

```
docker build -t beanstalkd-ui .
```

## Running Container

Once built, you can run a container manually using the following command.

```
docker run -d -p 80:80 beanstalkd-ui
```

If you need a beanstalk server, you can use the public image [1maa/beanstalkd](https://hub.docker.com/r/1maa/beanstalkd)

```
docker run -h beanstalkd -d -p 11300:11300 1maa/beanstalkd
```

## Runtime Configuration

To configure webapp with a custom beanstalk server to load at runtime, set the `BEANSTALKD_HOST` and `BEANSTALKD_PORT` environment variables.

```
docker run -d -p 80:80 \					 
	-e 'BEANSTALKD_HOST=beanstalkd' \
	-e 'BEANSTALKD_PORT=11300' \
	beanstalk-ui
```

## Docker Compose

There is a [docker-compose.yaml](docker-compose.yaml) as example for build and run beanstalkd-ui an beanstalkd server with docker-compose.

```
docker-compose up
```
