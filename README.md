# Virtualmin-Support
Scripts for use with the Virtualmin Web Control Panel on CentOS

These scripts were developed for use with Virtualmin servers running CentOS. They can be adapted for Ubuntu and other derivatives and should work on any server. 

# CheckRBL
checkrbl.sh simply checks the logs to see how effective the RBL's are at blocking inbound mail. It also checks for mails rejected for failing a reverse dns check. This is inspired by PFLogSumm which is a great perl script for doing the exact same thing way more verbosely and thoroughly, but this is in an easier to read format.
