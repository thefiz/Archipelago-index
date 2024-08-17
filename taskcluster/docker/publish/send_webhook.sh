#!/bin/sh

SECRET_URL="http://taskcluster/secrets/v1/secret/ap-lobby"
SECRET=$(curl ${SECRET_URL})

KUBECFG=$(echo "${SECRET}" | jq -r '.secret.kubecfg')
mkdir -p ${HOME}/.kube
echo "${KUBECFG}" > ${HOME}/.kube/config

KEY=$(echo "${SECRET}" | jq -r '.secret.admin_key_staging')
curl -H "X-Api-Key: ${KEY}" https://ap-lobby-stg.bananium.fr/worlds/refresh
kubectl rollout -n ap-lobby-stg restart deployment yaml-checker-stg

KEY=$(echo "${SECRET}" | jq -r '.secret.admin_key_prod')
curl -H "X-Api-Key: ${KEY}" https://ap-lobby.bananium.fr/worlds/refresh
kubectl rollout -n ap-lobby-prod restart deployment yaml-checker-prod

