#!/bin/bash
wall "
	#Architecture: $(uname -a)
	#CPU physical: $(cat /proc/cpuinfo | grep processor | wc -l)
	#vCPU: $(cat /proc/cpuinfo | grep processor | wc -l)
	#Memory Usage: $(free -m | awk 'NR==2{printf "%s/%sMB (%.2f%%)", $3,$2,$3*100/$2}')
	#Disk Usage: $(df -h | awk '$NF=="/"{printf "%d/%dGB (%s)", $3,$2,$5}')
	#CPU Load: $(uptime | awk '{printf "%.2f%%\n", $(NF-2)}')
	#Last boot: $(who -b | awk '{print $3" "$4" "$5}')
	#LVM use: $(lsblk |grep lvm | awk '{if ($1) {print "yes";exit;} else {print "no"}}')
	#Connection TCP : $(ss -ta | grep ESTAB | wc -l) ESTABLISHED
	#User log: $(who | cut -d " " -f 1 | sort -u | wc -l)
	Network: IP $(hostname -I)($(ip a | grep link/ether | awk '{print $2}'))
	#Sudo : $(journalctl _COMM=sudo | grep COMMAND | wc -l) cmd
"