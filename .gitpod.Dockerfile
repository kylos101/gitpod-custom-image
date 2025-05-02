FROM redhat/ubi9:latest

ENV TRIGGER_REBUILD=0

RUN dnf install git git-lfs sudo gnupg -y && dnf clean all \
    && sudo update-ca-trust \
    && sudo dnf -y install dnf-plugins-core \
    && sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo \
    && sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod \
    && sed -i.bkp -e '/Defaults\tuse_pty/d' -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers 

USER gitpod
