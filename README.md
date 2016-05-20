# Virtualmin-Postfix
Scripts for use with the Virtualmin Web Control Panel, or standalone Postfix.

These scripts were developed for use with Virtualmin servers running CentOS. They can be adapted for Ubuntu and other derivatives and should work on any server running Postfix. 

# CheckRBL
checkrbl.sh simply checks the logs to see how effective the RBL's are at blocking inbound mail. It also checks for mails rejected for failing a reverse dns check. This is inspired by PFLogSumm which is a great perl script for doing the exact same thing way more verbosely and thoroughly, but this is in an easier to read format.

# Maildog
Maildog is intended to be ran as a cron job that you can use to check the mail queue of a postfix server (or with some minor edits, an exim server). If the mail queue exceeds a specified threshold, it will shoot of an email to the administrator of your choosing, and let them know that there is a problem.
