#!/bin/sh
awk -F',' '{ print $1 }' testdb.csv | uniq | xargs -I {} ls {}/

# | xargs -I {} sh -c echo 'Search <input placeholder="search"  style="border: 1px solid #ccc; padding: 5px;">' >> {}/{}-list.md
