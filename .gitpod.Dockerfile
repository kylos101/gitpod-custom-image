FROM amd64/ubuntu:latest

ENV TRIGGER_REBUILD=4

RUN apt-get update && apt-get install -yq \
    git \
    git-lfs \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -yq \
    ca-certificates curl gnupg lsb-release

RUN useradd -l -u 33333 -md /home/gitpod -s /bin/bash -p gitpod gitpod

RUN apt-get update && apt-get install -yq golang-go

USER gitpod
