FROM redhat/ubi9:latest

ENV TRIGGER_REBUILD=0

RUN dnf install git git-lfs sudo gnupg -y && dnf clean all \
    && sudo update-ca-trust

RUN useradd -l -u 33333 -G wheel -md /home/gitpod -s /bin/bash -p gitpod gitpod

USER gitpod
