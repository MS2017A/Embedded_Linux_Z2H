#!/bin/bash

<< 'Safe-Delete'
    sdel command is safe delete command to remove folder or/and files 
    the files will be compressed to tgz and moved to /TRASH 
    after 2 days the file removed permenant 
    to add the command to the cron kindly follow the following steps :
	-> $ crontab -e
		then select one of the editor available on your machine 
	-> Append the following line to run the command once an hour automatically
		@hourly /bin/sdel		
    HereDoc body is
    a multiline comment
Safe-Delete

cp sdel /bin/sdel
ArgumentsNum=$#

mkdir -p ~/TRASH

for (( c=1; c<=ArgumentsNum; c++ ))
do  
  if [ "$c" != "*.tgz" ]
  then
	tar -zcvf $c.tgz $c
	echo $c.tgz 
  fi
	mv $c.tgz ~/TRASH/$c.tgz
	rm -r $c
done

if [ $#==0 ]
filesReq=`find ~/TRASH/ -mtime +2`
then
for f in $filesReq; 
do
	echo $f 
	rm $f
done
fi
 
