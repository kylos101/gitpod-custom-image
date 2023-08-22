FROM amd64/ubuntu:latest

ENV TRIGGER_REBUILD=7

RUN apt-get update && apt-get install -yq \
    git \
    git-lfs \
    sudo \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -yq \
    ca-certificates curl gnupg lsb-release

RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod

RUN apt-get update && apt-get install -yq golang-go

RUN mkdir -p /workspace/work/work/work/work/work

USER gitpod
