#!/bin/sh
rm *.tmp 
rm *.md
awk -F',' '{ print "| " $2 }' testdb.csv >> tmp.tmp
tr '\r\n' ' ' < tmp.tmp  > line1.tmp  
echo "|" >> line1.tmp
awk -F',' '{ print "|"; for (i = 1; i <= length($3); i++) {printf "-";} }' testdb.csv >> line2.tmp
tr '\r\n' ' ' < line2.tmp  > line2a.tmp  
echo "|" >> line2a.tmp
cat line2a.tmp
cat line2a.tmp >> line1.tmp
awk -F',' '{ print "|" $3; }' testdb.csv >> line3.tmp
tr '\r\n' ' ' < line3.tmp  > line3a.tmp 
echo "|" >> line3a.tmp
cat line3a.tmp >> line1.tmp
cat line1.tmp
mv line1.tmp ./Users/Users-list.md
