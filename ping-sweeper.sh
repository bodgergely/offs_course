#!/bin/bash

rm machines.txt

for ip in $(seq 1 254); do
ping -c 2 10.11.1.$ip | grep "bytes from" | cut -d" " -f4| cut -d":" -f1 >> machines.txt &
done 

sleep 5

cat machines.txt | sort -u
cat machines.txt | sort -u | wc -l



