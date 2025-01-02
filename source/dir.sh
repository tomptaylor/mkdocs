#!/bin/sh
awk -F',' '{ print $1 }' testdb.csv | uniq | xargs -I {} mkdir {} 
awk -F',' '{ print $1 }' testdb.csv | uniq | xargs -I {} touch ./{}/{}-list.md
awk -F',' '{ print $1 }' testdb.csv | uniq | xargs -I {} sh -c 'echo "Search <input placeholder=\"search\"  style=\"border: 1px solid #ccc; padding: 5px;\">" >> {}/{}-list.md' 
