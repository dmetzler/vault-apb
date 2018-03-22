#!/usr/bin/env bash

set -x

echo TESTING

TARGET_NAMESPACE=$1

env | sort

export VAULT_ADDR=https://vault.$TARGET_NAMESPACE:8200/
export VAULT_SKIP_VERIFY=true
export VAULT_TOKEN=$VAULT_TOKEN
JSON=$(vault write -format=json pki/issue/service common_name="example.com" ttl=72h)

echo "$JSON" > /tmp/cert.json

echo "$JSON" | jq -r .data.certificate > /tmp/cert.pem
echo "$JSON" | jq -r .data.private_key > /tmp/cert.key
echo "$JSON" | jq -r .data.issuing_ca > /tmp/ca.pem
