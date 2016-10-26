#!/bin/sh
set -x

tar cvzf $1_$2.tar.gz $1-$2
rm -rf $1-$2
rm $1_latest.tar.gz
ln -s $1_$2.tar.gz $1_latest.tar.gz
gpg -b -a $1_$2.tar.gz
rm $1_latest.tar.gz.asc
ln -s $1_$2.tar.gz.asc $1_latest.tar.gz.asc
svn17 add $1_$2.tar.gz
svn17 add $1_$2.tar.gz.asc
svn17 st
