#!/bin/sh
rm *.md
awk -F','  'BEGIN {prevtable = $1}{
    
        table = $1; field = $2; filename =  table "-detail.md"; 
        if (table != prevtable) {
            print line; 
            line = ''; prevtable = table
        } else {
            line= line + "|" $2  
            }
        END { print line }
}
    ' testdb.csv

# awk -F',' '{ 
#     table = $1; field = $2; filename = "./" table "/" table "-detail.md";  
#     print field "<input placeholder=\"field\" style=\"border: 1px solid #ccc; padding: 5px;\"><br><br>" >> filename  } ' testdb.csv