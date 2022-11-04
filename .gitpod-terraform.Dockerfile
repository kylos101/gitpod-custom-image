FROM hashicorp/terraform:1.2.9

RUN apk add sudo

ENV TRIGGER_REBUILD=1
