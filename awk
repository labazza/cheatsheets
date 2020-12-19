---
tags [ awk,bash,linux ]
---

# operands like ==, <, >, <=, >=, and !=, as well as awk-specific operands ~ and !~, which mean “matches” and “does not match” respectively.

# To sum integers from a file or stdin, one integer per line:
printf '1\n2\n3\n' | awk '{ sum += $1} END {print sum}'

# To use a specific character as separator to sum integers from a file or stdin:
printf '1:2:3' | awk -F ":" '{print $1+$2+$3}'

# To print a multiplication table:
seq 9 | sed 'H;g' | awk -v RS='' '{for(i=1;i<=NF;i++)printf("%dx%d=%d%s", i, NR, i*NR, i==NR?"\n":"\t")}'

# To specify an output separator character:
printf '1 2 3' | awk 'BEGIN {OFS=":"}; {print $1,$2,$3}'

# Print every line containing 'com'
awk '/com/ {print $0}' ~/.ssh/known_hosts

# Print all lines with valid US number or hostname
awk '/^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$/ { print }' contacts
awk '/^resarcdb-[0-9][0-9][0-9]/ { print }' ~/.ssh/known_hosts

# Prints all lines longer than eighty characters in the file “data.”
awk 'length($0) > 80' data

# Prints all lines where the first field equals the string “user” using space as separator
$1 == "user" { print }

# Prints the third field whenever the fifth field matches the regular expression /root/.
$5 ~ /root/ { print $3 }

# Saving script as file
awk -f ~/scripts/program.awk data
