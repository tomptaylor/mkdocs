#!/bin/sh
awk -F',' '{ print $1 }' testdb.csv | uniq | xargs -I {} mkdir -p {}
