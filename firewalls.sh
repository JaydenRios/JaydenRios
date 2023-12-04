#!/bin/bash

#Flush existing iptables rules
iptables -F

#1. Deal with web server (open needed ports and forward port 80 traffic to 8080
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
iptables -A PREROUTING -t nat -p tcp --dport 80 -j REDIRECT --to-port 8080

#2 Deal with MySQL service (open ports needed)
iptables -A INPUT -p tcp --dport 3306 -j ACCEPT

#3 Deal with ssh service (allow incoming and outgoing SSH, script to deny SSH)
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 22 -j ACCEPT

#Script to deny SSH
#To deny SSH uncomment these lines
# iptables -A INPUT -p tcp --dport 22 -j DROP
# iptables -A OUTPUT -p tcp --dport 22 -j DROP

#4 Script to allow/block specific hosts, MAC Addresses
#Enter ip within the <...>
#iptables -A INPUT -s <...> -j ACCEPT
#iptables -A INPUT -s <...> -j DROP

#5 script to block telnet and ping
iptables -A INPUT -p tcp --dport 23 -j DROP
iptables -A INPUT -p icmp --icmp-type 8 -j DROP

#Save bew iptable rules
iptables-save
