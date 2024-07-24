FROM alpine:latest

RUN apk update && apk add bash coreutils python3 openssh-client git curl jq
COPY setup-ssh.sh /usr/local/bin/setup-ssh.sh
RUN chmod +x /usr/local/bin/setup-ssh.sh

# %include-run-task

# Add worker user
RUN mkdir /builds && \
    adduser -h /builds/worker -s /bin/ash -D worker && \
    mkdir /builds/worker/artifacts && \
    chown worker:worker /builds/worker/artifacts

ENV SHELL=/bin/ash \
    HOME=/builds/worker \
    PATH=/builds/worker/.local/bin:$PATH

VOLUME /builds/worker/checkouts
VOLUME /builds/worker/.cache

