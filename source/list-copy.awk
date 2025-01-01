{
table = $1; field = $2; filename =  table "-list.md"; 
    if (prevfilename==""){ prevfilename=filename}
 
        if (filename != prevfilename ) {
            print "|"line " | ">> prevfilename 
            print line2 " | ">> prevfilename 
            print ">>>" prevfilename
            line = field;  prevfilename = $1 "-list.md"
        } else {

            line= line " | " field; 
            line2 = line2 "|" 
            print "in", length($3)
            for (i = 1; i <= length($3); i++) {
                line2 = line2 "-" 
            }
            print "fff" field, line
            print "hhh", line2 
            }

        }
END { print line >> prevfilename; print line2 >> prevfilename }
