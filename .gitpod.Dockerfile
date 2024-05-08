FROM gitpod/workspace-base:2024-04-10-13-34-16

ENV TRIGGER_REBUILD=9

# RUN apt-get update && apt-get install -yq \
#     git \
#     git-lfs \
#     sudo \
#     && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*

# ARG DEBIAN_FRONTEND=noninteractive
# RUN apt-get update && apt-get install -yq \
#     ca-certificates curl gnupg lsb-release

# RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod

# RUN apt-get update && apt-get install -yq golang-go

USER gitpod

# # show env var keys
# RUN printenv | awk -F= '{print $1}' > /home/gitpod/build_time_vars

# RUN echo "${FOO_VISIBLE}" > /home/gitpod/only_with_gp_validate
# RUN echo "${FOO_HIDDEN}" > /home/gitpod/should_not_exist
