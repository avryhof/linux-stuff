#!/bin/bash
openssl x509 -in $1 -CAkey $2 -text -noout