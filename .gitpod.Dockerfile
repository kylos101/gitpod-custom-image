FROM amd64/ubuntu:latest

ENV TRIGGER_REBUILD=4

RUN apt-get update && apt-get install -yq \
    git \
    git-lfs \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -yq \
    ca-certificates curl gnupg lsb-release sudo 

RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod \
    # Remove `use_pty` option and enable passwordless sudo for users in the 'sudo' group
    && sed -i.bkp -e '/Defaults\tuse_pty/d' -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers

RUN apt-get update && apt-get install -yq golang-go

USER gitpod
