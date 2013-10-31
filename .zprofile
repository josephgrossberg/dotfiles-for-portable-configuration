PATH=/usr/local/bin:/usr/local/sbin:$PATH
SSL_CERT_FILE=/usr/local/etc/openssl/certs/cert.pem
SOLR_HOME=/usr/local/solr14
PATH=".bundle/bin:$PATH"
eval "$(rbenv init - | sed 's/bash/zsh/')"

