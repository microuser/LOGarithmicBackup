#!/bin/bash

#Run this as a cron job of */1 * * * * /home/dmp/DMPServer/backup.sh



thisYear=`date +%Y`
thisMonth=`date +%m`
thisWeek=`date +%v`
thisDay=`date +%d`
thisHour=`date +%H`
thisMinute=`date +%M`
thisTenMinute=$(($thisMinute/10))
thisOneMinute=$(($thisMinute%10))
thisSecond=`date +%S`

archiveBase=Universe

tar -zcvf /home/dmp/DMPServer/$archiveBase$thisYear-$thisMonth-$thisDay-$thisHour-$thisMinute-$thisSecond.tar.gz /home/dmp/DMPServer/Universe

cd /home/dmp/DMPServer
find . -name "$archiveBase*.tar.gz" -regextype sed -not -regex "\(.*/$archiveBase$thisYear-$thisMonth-$thisDay-$thisHour-$thisTenMinute[0-9]-[0-9][0-9].tar.gz\)\|\(.*/$archiveBase$thisYear-$thisMonth-$thisDay-$thisHour-[0-9]0-[0-9][0-9].tar.gz\)\|\(.*/$archiveBase$thisYear-$thisMonth-$thisDay-[0-2][0-9]-00-[0-9][0-9].tar.gz\)\|\(.*/$archiveBase$thisYear-$thisMonth-[0-9][0-9]-00-00-[0-9][0-9].tar.gz\)\|\(.*/$archiveBase$thisYear-[0-1][0-9]-01-00-00-[0-9][0-9].tar.gz\)\|\(.*/$archiveBase20[0-9][0-9]-01-01-00-00-[0-9][0-9].tar.gz\)" -exec echo {} \;
#bump that amazing sed one-liner filtering for the records

