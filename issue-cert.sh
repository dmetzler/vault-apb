#!/usr/bin/env bash

set -x

TARGET_NAMESPACE=$1
COMMON_NAME=$2

export VAULT_ADDR=https://vault.$TARGET_NAMESPACE.svc:8200/
export VAULT_CACERT=/var/run/secrets/kubernetes.io/serviceaccount/service-ca.crt
export VAULT_TOKEN=$VAULT_TOKEN
JSON=$(vault write -format=json pki/issue/service common_name="$COMMON_NAME" ttl=72h)

echo "$JSON" | jq -r .data.certificate > /tmp/cert.pem
echo "$JSON" | jq -r .data.private_key > /tmp/cert.key
echo "$JSON" | jq -r .data.issuing_ca > /tmp/ca.pem
