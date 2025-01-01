#!/bin/sh
total_lines=$(wc -l < testdb.csv) 
awk -F','  '{
        table = $1; field = $2; filename = "./" table "/" table "-detail.md"; 
        if (field != "Action") {
        print field "<input placeholder=\"field\" style=\"border: 1px solid #ccc; padding: 5px;\"><br><br>" >> filename  
    }}
    ' testdb.csv
