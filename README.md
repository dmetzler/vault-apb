# vault-apb

This APB deploys the Vault service from Hashicorp in a mode where it generates
a TLS certificate for each binding. All such certificates are signed by the
same CA. When initiating a bind, the user must supply the desired Common Name.

## Status

This APB is an experimental proof of concept.
