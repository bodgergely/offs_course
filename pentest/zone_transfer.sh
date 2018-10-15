#!/bin/bash
# Simple Zone Transfer Bash Script
# $1 is the first argument given
# Check if this argument was given

if [ -z "$1" ]; then
  echo "[*] Simple Zone transfer script"
  echo "[*] Usage : $0 <domain name>"
  exit 0
fi

# If argument was given identify the DNS servers for the domain
# For each of these servers, attempt a zone transfer

DOMAIN=$1

for n in $(host -t ns $DOMAIN | cut -d" " -f4); do
  host -l $DOMAIN $n;
done | grep "has address" | cut -d" " -f1,4

