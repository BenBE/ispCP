#!/bin/bash

#3650 = 10 years
DAYS=3650
BITS=2048

openssl req -newkey rsa:$BITS -new -x509 -keyout newkey.pem -out newcert.pem -days $DAYS -nodes -batch
cat newcert.pem >> newkey.pem
rm newcert.pem
mv newkey.pem ssl.key
chmod 600 ssl.key
