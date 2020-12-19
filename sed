---
tags [ bash,linux ]
---

# **x** : swap the pattern and hold space so that the prior line is in the pattern space
# **p** : print the prior line
# **d** : delete the pattern space and start processing next line
# **x** : This is executed only on lines which do not contain age is : 10. In this case, it saves the current line in the hold space.

# To replace all occurrences of "day" with "night" and write to stdout:
sed 's/day/night/g' <file>

# To replace all occurrences of "day" with "night" within <file>:
sed -i 's/day/night/g' <file>

# To replace all occurrences of "day" with "night" on stdin:
echo 'It is daytime' | sed 's/day/night/g'

# To remove leading spaces:
sed -i -r 's/^\s+//g' <file>

# To remove empty lines and print results to stdout:
sed '/^$/d' <file>

# To replace newlines in multiple lines:
sed ':a;N;$!ba;s/\n//g' <file>

# To insert a line before a matching pattern:
sed '/Once upon a time/i\Chapter 1'

# To add a line after a matching pattern:
sed '/happily ever after/a\The end.'

# Print the line above the match
sed -n -e '/match/{x;p;d;}' -e x file.txt

# "&" it corresponds to the pattern found.
sed 's/[a-z]*/(&)/' <old >new

# "\n" as remembered pattern
sed 's/\([a-z]*\).*/\1/' file

# Switch two words
sed 's/\([a-z]*\) \([a-z]*\)/\2 \1/'

# But to make sure a word has at least one letter:
sed -r 's/([a-z]+) ([a-z]+)/\2 \1/'

# Keep only first word and not second
sed 's/\([a-zA-Z]*\) \([a-zA-Z]*\) /\1 /p'

# Like grep
sed -n 's/pattern/&/p' file

# "/I" ignore case
sed -n '/abc/I p' <old >new

# To delete the first number line 3
sed '3 s/[0-9][0-9]*//' <file >new

# To delete line ranges
sed '1,100 s/A/a/'

# Delete the first number on all lines starting with #
sed '/^#/ s/[0-9][0-9]*//'

# Assuming a "#" starts a comment, you can search for a keyword, remove all comments until you see the second keyword.
sed '/start/,/stop/ s/#.*//'

# Can be combined with line numbers
sed -e '1,/stop/ s/#.*//'

# Delete comments and blank lines
sed -e 's/#.*//' -e '/^$/ d'

# Add at beginning od the line
sed -i -e 's/^/prefix/' file

# To double every empty line
sed '/^$/ p'

# Quit after 11th line
sed '11 q'

# only write lines that start with an even number (and followed by a space)
sed -n 's/^[0-9]*[02468] /&/w even' <file
sed -n '/^[0-9]*[02468]/ w even' <file

# Transform
sed 'y/abcdef/ABCDEF/' file

# Multi replacement
sed 's/and/\&/g;s/^I/You/g' ahappychild

# Delete empty or comment lines
sed '/^#\|^$/d' apache2.conf
