---
tags [ bash ]
---

# To implement a for loop:
for file in *;
do
    echo $file found;
done

# To implement a case command:
case "$1"
in
    0) echo "zero found";;
    1) echo "one found";;
    2) echo "two found";;
    3*) echo "something beginning with 3 found";;
esac

# To turn on debugging:
set -x

# To turn off debugging:
set +x

# Retrieve N-th piped command exit status:
printf 'foo' | fgrep 'foo' | sed 's/foo/bar/'
echo ${PIPESTATUS[0]}  # replace 0 with N

# To create a lockfile:
( set -o noclobber; echo > my.lock ) || echo 'Failed to create lock file'

# remove ".jpg" from filename
${filename%.jpg}

# length of string
echo ${#var}

# slice string, starting at third character and asking 4 characters after that
d=${c:3:4}
echo ${c: -4:3}

# in variable fruit i replace first instance of banana with durian
echo ${fruit/banana/durian}

# in variable fruit i replace all instance of banana with durian
echo ${fruit//banana/durian}

# replace only if at the very beginning of the string
echo ${fruit/#apple/durian}

# replace only if at the very end of the string
echo ${fruit/%apple/durian}

# replace with matching
echo ${fruit/c*/durian}

# All Characters
chars=${myvar#*.}

# array
a=()
b=(“apple” “banana” “cherry”)
echo ${b[2]}
b[5]=“kiwi”
b+=(“mango”)
echo ${b[@]}                      - all array
echo ${b[@]: -1}                  - last element
${!arr[@]}                        - Retrieve array indices
${#arr[@]}                        - Calculate array size
arr[0]=3                          - Overwrite 1st element
arr=$(ls)                         - Save ls output as a string
arr=( $(ls) )                     - Save ls output as an array of files
${arr[@]:s:n}                     - Retrieve elements at indices n to s+n

# Associative arrays or dictionaries
# supported only from bash 4
declare -A myaarray
myarray[color]=blue
myarray[“office building”]=“HQ West”
echo ${myarray[“office building”]} is ${myarray[color]}

# reading text files
i=1
while read f; do
    echo “Line $i: $f”
    ((i ++))
done < file.txt

# While
i=0
while [$i -le 10 ]; do
     echo i:$i
     ((i+=1))
done
j=0

# Until
until [$j -ge 10 ]; do
     echo j:$i
     ((j+=1))
done

# For with brace expansion
for i in {1..100..2}
do
     echo $i
done

# For in c style
for (( i=1; i<=10; i++ ))
do
    echo $i
done

# For with array
arr=(“apple” “banana” “cherry")
for i in ${arr[@]}
do
     echo $i
done

# For with associative array
declare -A arr
arr[“name”]=“Scott”
arr[“id”]=“1234”
for i in “${!arr[@]}” #exclamation mark is to access the keys on the array, quotes is to accommodate spaces since i use strings in keys
do
     echo “$i: ${arr[$i]}” #show the key and the value of that key
done

# Globbing
# In BASH pattern matching is called file globbing and all commands can use it. Also for **Character Classes** Look for "Pattern Matching" in man bash

# to match the hyphon
[-1-9]
ls file[![:digit:]].txt
ls file[![:digit:][:spaces:]].txt

# Extended globs allow:
# - specify the number of matches
# - allow grouping matches
# - patterns can be more than one character
# - logical OR
# Look for **extglob** in:
shopt 
shopt -s extglob  # ~/.bashrc for persistency

# match 0 or 1 occurrence of pattern match
file?(abc).txt
# match 1 or more occurences
file+(abc).txt
# match one or the other pattern
+(*.jpg|*.gif)
# match 0 or more occurrences of pattern
photo*(abc).jpg
# invert pattern match
!(*.jpg|*.gif)
# all files that do start with photo or file and don’t end with jpg or gif
!(+(photo|file)*+(.jpg|.gif)))

# Square brackets in bash
# List files in 70s and 80s
ls file0\[78\]?

# list file022, file027, file028, file052, file057, file058, file092, file097, and file98 you can do this:
ls file0\[259\]\[278\]

# It prints "Goodbye Cruel World" because #Hello gets rid of the Hello part at the beginning of the string stored in myvar.
myvar="Hello World"
echo Goodbye Cruel ${myvar#Hello}

# Curly braces in bash
# sequence builder
dec2bin=({0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1})
echo ${dec2bin[25]}

# parameter expansion
a="Too longgg"
echo ${a%gg}
i=image.jpg
convert $i ${i%jpg}png

# output grouping
# will execute all the commands but will only copy into the PNGs.txt file the output from the last ls command in the list. However, doing
+echo "I found all these PNGs:"; find . -iname "*.png"; echo "Within this bunch of files:"; ls > PNGs.txt
# creates the file PNGs.txt with everything, starting with the line "I found all these PNGs:"
{ echo "I found all these PNGs:"; find . -iname "*.png"; echo "Within this bunch of files:"; ls; } > PNGs.txt
