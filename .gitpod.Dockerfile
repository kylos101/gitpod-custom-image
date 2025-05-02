FROM redhat/ubi9:latest

ENV TRIGGER_REBUILD=0

RUN dnf install git git-lfs sudo gnupg -y && dnf clean all \
    && sudo update-ca-trust \
    && curl -fsSL https://get.docker.com -o get-docker.sh \
    && sudo sh ./get-docker.sh

# add gitpod user to sudo (wheel) group
RUN useradd -l -u 33333 -G wheel -md /home/gitpod -s /bin/bash -p gitpod gitpod \
    # Remove `use_pty` option and enable passwordless sudo for users in the 'sudo' group
    && sed -i.bkp -e '/Defaults\tuse_pty/d' -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers

# Configure a custom prompt
RUN echo 'source /usr/share/git-core/contrib/completion/git-prompt.sh' >> /home/gitpod/.bashrc && \
    echo 'export PS1="\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]\$(__git_ps1 \" (%s)\") \$ "' >> /home/gitpod/.bashrc && \
    chown gitpod:gitpod /home/gitpod/.bashrc

USER gitpod
