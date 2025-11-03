#!/bin/sh
rm *.tmp 
rm *.md
rm Users/*.md
awk -F',' '{ print "| " $2 }' testdb.csv >> tmp.tmp
# sed 's/\r/|/g' tmp.tmp >> tmp1.tmp
# just pull the fields
# awk -F',' '{print $2 }' tmp.tmp >> tmp2.tmp
# tap on the action column
# echo "| Action |" >> tmp.tmp
# tap pipe in front 
# echo "|" | cat - tmp2.tmp >> tmp3.tmp
tr '\r\n' ' ' < tmp.tmp  > line1.tmp  
echo "|" >> line1.tmp
# add line for headings
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
#cat line1.md
# awk -F',' '{ print "|"; for (i = 1; i <= length($2); i++) printf "-"; print "|" }' testdb.csv >> line2.tmp
# awk -F',' '{                                                                           
#      data = $3; field = $2; filename = "./" table "/" table ".md";  
#     print "|" field >> filename  
#     } ' test2.tmp
# echo "Action |" >> test2.tmp
# awk -F',' '{ 
#     print "|"; for (i = 1; i <= length($2); i++) printf "-"; print "|" >> filename 
#     }' testdb.csv