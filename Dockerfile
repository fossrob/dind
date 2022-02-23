# Use upstream docker in docker image
FROM docker:dind

# Use local docker socket by default
ENV DOCKER_HOST='unix:///var/run/docker.sock'

# Add docker daemon configuration
COPY ./config/daemon.json /etc/docker/

# Update and install packages
RUN apk upgrade --no-cache && apk add --no-cache bash docker-compose
