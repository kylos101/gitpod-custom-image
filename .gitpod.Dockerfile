FROM buildpack-deps:bullseye

RUN apt-get update && apt-get install -yq \
    sudo \
    git \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*

RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod

USER gitpod
