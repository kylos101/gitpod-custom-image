FROM hashicorp/terraform:1.2.9

RUN apk add sudo bash

ENV TRIGGER_REBUILD=1
