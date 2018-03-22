#!/usr/bin/env bash

set -x

#entrypoint.sh "$@"

#if [[ "$1" != "provision" ]]
#then
    #exit 0
#fi

#sleep 10

#JSON="$3"

#TARGET_NAMESPACE=$(echo "$JSON" | jq -r .namespace)
TARGET_NAMESPACE=$1

export VAULT_ADDR=https://vault.$TARGET_NAMESPACE.svc:8200/
export VAULT_CACERT=/var/run/secrets/kubernetes.io/serviceaccount/service-ca.crt

INIT_DATA=$(vault init -format=json -key-shares=1 -key-threshold=1)
#echo $INIT_DATA
export VAULT_TOKEN=$(echo $INIT_DATA | jq -r .root_token)
VAULT_UNSEAL_KEY=$(echo $INIT_DATA | jq -r .unseal_keys_hex[0])

vault unseal "$VAULT_UNSEAL_KEY"

echo "$VAULT_TOKEN" > /tmp/vault_token
echo "$VAULT_UNSEAL_KEY" > /tmp/vault_unseal_key

vault mount -path=pki pki
vault write pki/root/generate/internal common_name="$TARGET_NAMESPACE CA"

vault write pki/roles/service allow_any_name=true
