#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048  \
	-keyout $CERT_KEY \ 
	-out $CERTS_ \
	-subj "/C=MO/L=KH/O=42/OU=student/CN=nmascrie.42.ma"
