#!/bin/sh

# Generate self-signed CA key/cert
openssl req -new -newkey rsa:4096 -days 1825 -nodes -x509 \
    -subj "$OPENSSL_SUBJ" \
    -keyout ./volume/ca.key -out ./volume/ca-cert.pem

# Generate server cert signing request
openssl req -new -newkey rsa:4096 -nodes \
    -subj "$OPENSSL_SUBJ" \
    -out ./volume/request.csr -keyout ./volume/server.key

# Sign the CSR and create the server cert
openssl ca -config ca.conf -out ./volume/server-cert.pem -infiles ./volume/request.csr

# Create Diffie-Hellman parameter file
openssl dhparam -out ./volume/dh4096.pem 4096