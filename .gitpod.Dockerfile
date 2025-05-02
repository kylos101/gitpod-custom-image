FROM redhat/ubi9:latest

ENV TRIGGER_REBUILD=0

RUN dnf install git git-lfs sudo gnupg -y && dnf clean all \
    && sudo update-ca-trust \
    && curl -fsSL https://get.docker.com -o get-docker.sh \
    && sudo sh ./get-docker.sh

RUN useradd -l -u 33333 -G wheel -md /home/gitpod -s /bin/bash -p gitpod gitpod \
    && sed -i.bkp -e '/Defaults\tuse_pty/d' -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers 

USER gitpod
