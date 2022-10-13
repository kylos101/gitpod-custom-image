FROM buildpack-deps:bullseye

RUN apt-get update && apt-get install -yq \
    sudo \
    git \
    jq \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*

# Install tailscale. Requires sudo.
RUN curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.gpg | sudo apt-key add - \
    && curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.list | sudo tee /etc/apt/sources.list.d/tailscale.list \
    && apt-get update && apt-get install -yq \
    tailscale \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*

RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod

USER gitpod
