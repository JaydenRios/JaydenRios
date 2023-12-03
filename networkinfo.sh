#!/bin/bash

#current time and date
DATE=$(date +%Y-%m-%d)


#IFCONFIG
ifconfig_output=$(ifconfig)

#IP ADDRESS
IpAddr=$(ip addr)

#DNS SERVERS
DNS=$(dig)

#open ports / netstat
PORTS=$(netstat -tuln)

#ping google.com 3 times
PING=$(ping -c3 google.com)

#Send network info to the file

echo "Ifconfig: $ifconfig_output" >> Networkinfo_$DATE.txt
echo "IP ADDR: $IpAddr" >> Networkinfo_$DATE.txt
echo "DNS SERVERS: $DNS" >> Networkinfo_$DATE.txt
echo "OPEN PORTS: $PORTS" >> Networkinfo_$DATE.txt
echo "PING GOOGLE.COM: $PING" >> Networkinfo_$DATE.txt


#Display info to commandline

echo "IP ADDR: $IpAddr"
echo "Ifconfig: $ifconfig_output"
echo "DNS SERVERS: $DNS"
echo "OPEN PORTS: $PORTS"
echo "PING GOOGLE.COM: $PING"

#Exit script


