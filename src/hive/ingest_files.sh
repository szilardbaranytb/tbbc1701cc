#!/bin/bash

SRCDIR=/vagrant/data/skynet
HFSDIR=/data/skynet

# Create directory for Skynet data in HDFS
hadoop fs -mkdir $HFSDIR

# Upload FAA Releasable Aircraft data
hadoop fs -mkdir $HFSDIR/MASTER
hadoop fs -put $SRCDIR/MASTER.txt $HFSDIR/MASTER

hadoop fs -mkdir $HFSDIR/ACFTREF
hadoop fs -put $SRCDIR/ACFTREF.txt $HFSDIR/ACFTREF

# Upload ADS-B Exchange data
hadoop fs -mkdir $HFSDIR/adsb
hadoop fs -put $SRCDIR/**/*.json $HFSDIR/adsb

# EOF
