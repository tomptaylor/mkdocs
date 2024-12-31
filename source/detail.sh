#!/bin/sh
total_lines=$(wc -l < testdb.csv) 
awk -F','  -v total_lines="$total_lines" 'BEGIN { print total_lines }{
    if (NR<total_lines) {
        table = $1; field = $2; filename = "./" table "/" table "-detail.md";  
        print field "<input placeholder=\"field\" style=\"border: 1px solid #ccc; padding: 5px;\"><br><br>" >> filename  
    }}
    ' testdb.csv
