#!/bin/bash
# For Postfix servers 
# Created by Ryan Flowers
# https://github.com/corneliusroot
# Licensed under the MIT License
# Count how often the RBL's are blocking mail to check for effectiveness

#gonna need a tmpfile too, might as well make it a unique name
tmpfile="/tmp/`date +%N`.checkrbl"

#get a list of the RBL's
postfixrbl=$(grep reject_rbl_client /etc/postfix/main.cf | awk '{ print $2 }' | cut -d, -f1)

#define the log file we'll be checking
mlog=/var/log/maillog

#do the needful
for rbl in $postfixrbl; do
		
	# count the number of times it's grepped. Probably inneficient to do this for every single one, but it works.
	# assign it to a variable so it's easier to display with one echo statement
	rblcount=$(grep $rbl $mlog | wc -l)

	#display it with aforementioned echo statement and dump it into a tempfile
	printf "%-5s%1s\n" $rblcount   $rbl >> $tmpfile
done

# show the number of items rejected due to bad reverse dns
	rejectcount=$(grep "cannot find your hostname" /var/log/maillog | wc -l)
	printf "$rejectcount Messages rejected due to failed rDNS" >> $tmpfile
sort -n $tmpfile
echo "--------------------"
echo `awk '{s+=$1} END {print s}' $tmpfile` Total Spam Messages Blocked
rm -f $tmpfile
