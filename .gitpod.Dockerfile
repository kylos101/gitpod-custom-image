FROM amd64/ubuntu:latest

ENV TRIGGER_REBUILD=6

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

USER gitpod

# show env var keys
RUN printenv | awk -F= '{print $1}' > /home/gitpod/build_time_vars

RUN echo "FOOBAR_VISIBLE" > /home/gitpod/only_with_gp_validate
