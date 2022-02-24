# Use upstream docker in docker image
FROM docker:dind

# Use local docker socket by default
ENV DOCKER_HOST='unix:///var/run/docker.sock'

# Change default behavior to not use TLS
ENV DOCKER_TLS_CERTDIR=

# Modify entrypoint script to not bind to port 2375 if not using TLS
COPY ./scripts/dockerd-entrypoint.sh /usr/local/bin/dockerd-entrypoint.sh

# Add docker daemon configuration
COPY ./config/daemon.json /etc/docker/

# Update and install packages
RUN apk upgrade --no-cache && apk add --no-cache bash docker-compose

# Add docker group
RUN addgroup -S docker
