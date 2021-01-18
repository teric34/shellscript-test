#!/bin/sh
DIR="/tmp/"
FILE="_.$DOMAINS2.crt"
DFILE=$DIR$FILE
EXP=$EXPIRE
BFD=$BFDAY
LOGFILE=$DIR"shellscript.log"
echo $LOGFILE
#

if [ -e $DFILE ]; then
    # if file exits, proceed to renew or do nothing.
    FDATE=`date -r $DFILE "+%s"`
    TDATE=`date "+%s"`
    DDATE=`expr \( $TDATE - $FDATE \) / 60 / 60 / 24`
    DDATE=`expr $EXP - $DDATE` 
    echo $DDATE

    if [ ${DDATE} -le 0 ]; then
        echo `date` 'certificate is expired!' >> $LOGFILE 2>&1
        # take certificate
    elif [ ${DDATE} -lt ${BFD} ]; then
        echo `date` 'certificate expiry day is less than 5 days!'  >> $LOGFILE 2>&1
        # renew certificate
        # restart nginx
    else
        echo `date` 'certificate expiry day is far enough!' >> $LOGFILE 2>&1
        # do nothing
    fi
    else
        echo `date` 'no certificate!' >> $LOGFILE 2>&1
        # take certificate
fi