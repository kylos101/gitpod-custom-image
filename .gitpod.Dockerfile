FROM gitpod/workspace-full
ENV TRIGGER_REBUILD=0

USER root
RUN mkdir /var/gitpod
RUN echo ${TEST_ME} > /var/gitpod/test_me
RUN echo "foo" > /var/gitpod/bar

USER gitpod

# show env var keys
RUN printenv | awk -F= '{print $1}' > /home/gitpod/build_time_vars

RUN echo "${FOO_VISIBLE}" > /home/gitpod/only_with_gp_validate
RUN echo "${FOO_HIDDEN}" > /home/gitpod/should_not_exist
