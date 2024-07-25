#!/bin/sh

ADMIN_KEY_URL="http://taskcluster/secrets/v1/secret/ap-lobby"
mkdir -p ${HOME}/.ssh
KEY=$(curl ${ADMIN_KEY_URL} | jq -r '.secret.admin_key_staging')

curl -H "X-Api-Key: ${KEY}" https://ap-lobby-stg.bananium.fr/worlds/refresh
