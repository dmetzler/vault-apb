# vault-apb

This APB deploys the Vault service from Hashicorp in a mode where it generates
a TLS certificate for each binding. All such certificates are signed by the
same CA. When initiating a bind, the user must supply the desired Common Name.

## Usage

The image from the Vault project requires running as a specific user, so before
use on OpenShift, you must run this command in the target project:

```
oc adm policy add-scc-to-user anyuid -z default
```

## Status

This APB is an experimental proof of concept.
