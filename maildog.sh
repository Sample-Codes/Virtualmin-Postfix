#!/bin/bash
# MailDog v.01
# For Postfix servers
# Created by Ryan Flowers
# https://github.com/corneliusroot
# Licensed under the MIT License
# Check the mail queue and raise a red flag if there is a problem
# Under most circumstances, this will still be able to mail out
# since most mail queue issues are due to rejected mail. Outbound
# mail usually still works.
# Some elements taken from PFLogSumm, namely the start/end date variables

#Set Variables
#Where do you want the mail sent?
alertmail="you@yourname.com"

#How big should the queue be to generate an alert?
mailthreshold="1000"

#Your server's hostname, or a nickname for it that you'll recognize:
servernick="ServerName"

pq=$(mailq | tail -1 | awk '{ print $5 }')

# For testing, comment the pq variable above, and set the threshold to 14. Then uncomment the following line
#pq=15

if [ -z $pq ]
	then
	echo "Mail Queue is emtpy- nothing to see here!"
        exit 1
fi
if [ $pq -le 1000 ]
        then
	echo "It's all good:" $pq
        else
            	MESSAGE=/tmp/maildogmsg
                echo "Subject: $servernick  Mail Queue Alert $(date "+%H:%M %d.%m.%y")" > $MESSAGE
                echo "To: $alertmail" >> $MESSAGE
                echo "URGENT Mail Server Notification" >> $MESSAGE
                echo "Current Queue is at $pq" >> $MESSAGE
                cat $MESSAGE | sendmail -F "$servernick Mail Queue Alert" $alertmail

fi
