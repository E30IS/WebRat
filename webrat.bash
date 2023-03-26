#!/bin/bash

# Ask user for the website URL
read -p "Enter the URL of the website to be tested (e.g. webrat.com): " WEBSITE

# Check for open ports using Nmap
echo "Scanning for open ports on $WEBSITE"
nmap $WEBSITE

# Use Nikto to check for known vulnerabilities
echo "Checking for known vulnerabilities on $WEBSITE"
nikto -h $WEBSITE

# Use Dirb to enumerate directories
echo "Enumerating directories on $WEBSITE"
dirb http://$WEBSITE

# Use Wapiti to check for vulnerabilities
echo "Checking for vulnerabilities using Wapiti on $WEBSITE"
wapiti -u http://$WEBSITE
