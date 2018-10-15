#!/bin/bash

HOST=$1

for name in $(cat subdomain_list.txt);
do host $name.$HOST | grep "has address" | cut -d" " -f1,4;
done
