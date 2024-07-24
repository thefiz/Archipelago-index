FROM alpine:latest

RUN apk update && apk add bash coreutils python3 openssh-client git curl jq

# %include-run-task

COPY setup-ssh.sh /usr/local/bin/setup-ssh.sh

