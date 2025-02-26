{
table = $1; field = $2; filename =  table"/"table "-list.md"; 
    if (prevfilename==""){ print filename;prevfilename=filename}
 
        if (filename != prevfilename ) {
            print prevfilename
            print line " | ">> prevfilename 
            print line2 " | ">> prevfilename 
            print line3 " | ">> prevfilename 
            line = field;  line2=""; line3= "|"$3; prevfilename = $1"/"$1 "-list.md"
        } else {

            line= line "| " field; 
            line2 = line2 "|" 

            for (i = 1; i <= length($3); i++) {
                line2 = line2 "-" 
            }
            myvar = substr($3, 1, length($3)-1)
            line3 = line3 "|" myvar
            }

        }
END { print line "|" >> prevfilename; print line2 "|" >> prevfilename; print line3 "|" >> prevfilename }
