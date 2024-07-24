#!/bin/sh

DEPLOY_KEY_URL="http://taskcluster/secrets/v1/secret/Archipelago-index"
mkdir -p ${HOME}/.ssh
curl ${DEPLOY_KEY_URL} | jq -r '.secret.ssh_privkey' > ${HOME}/.ssh/id_25519

chmod 700 ${HOME}/.ssh
chmod 600 ${HOME}/.ssh/id_25519

git config --global user.name "Taskcluster"
git config --global user.email "eijebong+taskcluster@bananium.fr"

