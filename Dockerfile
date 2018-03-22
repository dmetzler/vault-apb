FROM ansibleplaybookbundle/apb-base

LABEL "com.redhat.apb.spec"=\
"dmVyc2lvbjogMS4wCm5hbWU6IHZhdWx0LWFwYgpkZXNjcmlwdGlvbjogRGVwbG95cyBoYXNoaWNv\
cnAgdmF1bHQgd2l0aCBhIHNpbmdsZSBrZXkKYmluZGFibGU6IFRydWUKYXN5bmM6IG9wdGlvbmFs\
Cm1ldGFkYXRhOgogIGRpc3BsYXlOYW1lOiB2YXVsdApwbGFuczoKICAtIG5hbWU6IENBCiAgICBk\
ZXNjcmlwdGlvbjogVGhpcyBwbGFuIGlzc3VlcyBUTFMgY2VydGlmaWNhdGVzIGR1cmluZyBiaW5k\
LCBhbGwgc2lnbmVkIGJ5IHRoZSBzYW1lIENBLgogICAgZnJlZTogVHJ1ZQogICAgbWV0YWRhdGE6\
IHt9CiAgICBwYXJhbWV0ZXJzOiBbXQogICAgYmluZF9wYXJhbWV0ZXJzOgogICAgICAtIG5hbWU6\
IGNvbW1vbl9uYW1lCiAgICAgICAgdGl0bGU6IENvbW1vbiBOYW1lCiAgICAgICAgdHlwZTogc3Ry\
aW5nCiAgICAgICAgZGlzcGxheV90eXBlOiB0ZXh0CiAgICAgICAgcmVxdWlyZWQ6IFRydWUKICAg\
IAo="



















































RUN curl https://releases.hashicorp.com/vault/0.9.6/vault_0.9.6_linux_amd64.zip | gunzip > /usr/bin/vault && chmod 755 /usr/bin/vault
RUN yum -y install jq && yum clean all
COPY vault-entry.sh /usr/bin/vault-entry.sh
COPY issue-cert.sh /usr/bin/issue-cert.sh
COPY playbooks /opt/apb/actions
COPY roles /opt/ansible/roles
COPY vault-config /opt/vault-config
RUN chmod -R g=u /opt/{ansible,apb,vault-config}
USER apb

#ENTRYPOINT ["vault-entry.sh"]
