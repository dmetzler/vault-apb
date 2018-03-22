FROM ansibleplaybookbundle/apb-base

LABEL "com.redhat.apb.spec"=\
"dmVyc2lvbjogMS4wCm5hbWU6IHZhdWx0LWFwYgpkZXNjcmlwdGlvbjogVGhpcyBpcyBhIHNhbXBs\
ZSBhcHBsaWNhdGlvbiBnZW5lcmF0ZWQgYnkgYXBiIGluaXQKYmluZGFibGU6IFRydWUKYXN5bmM6\
IG9wdGlvbmFsCm1ldGFkYXRhOgogIGRpc3BsYXlOYW1lOiB2YXVsdApwbGFuczoKICAtIG5hbWU6\
IGRlZmF1bHQKICAgIGRlc2NyaXB0aW9uOiBUaGlzIGRlZmF1bHQgcGxhbiBkZXBsb3lzIHZhdWx0\
LWFwYgogICAgZnJlZTogVHJ1ZQogICAgbWV0YWRhdGE6IHt9CiAgICBwYXJhbWV0ZXJzOiBbXQo="



















































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
