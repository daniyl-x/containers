#!/bin/sh


cname=${1:-"do-not-trust.me"}
days=3650
key_file="private_key.pem"
cert_file="public_certificate.pem"

if [[ -e "$key_file" || -e "$cert_file" ]]; then
    printf "[%s] Key or certificate file already exists, skipping." "$0"
    exit 0
fi

printf "[%s] Generating self-signed certificate with CN=%s.\n" "$0" "$cname"
printf "[%s] Certificate will be valid for %s days.\n" "$0" "$days"

openssl req -x509 -nodes \
    -newkey rsa:4096 \
    -days "$days" \
    -keyout "$key_file" \
    -out "$cert_file" \
    -subj "/CN=${cname}"

