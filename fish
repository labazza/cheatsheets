---
tags [fish,shell ]
---

# Help
Alt H        - Help on word (man)
Alt W        - Help on word (short descriptions)
Alt L        - List directory on cursor

# Keys
Shortcut             - Description
Alt ← / Alt →        - Move word
^U                   -Delete to beginning
^W                   - Delete to previous /
^D                   - Delete next character
Alt D                - Delete next word
^C                   - Cancel line
Alt P                - Page output
Alt ↑ / Alt ↓        - Previous / next arguments
Alt E / Alt V        - Open in external editor
^L                   - Repaint screen

# bash.rc: fish starts by executing commands in ~/.config/fish/config.fish

# multiple wildcards
ls l*.p*

# directory recursive wildcard
ls /var/**.log

# setting variable
set name 'Mister Brown'
echo $name

# exit status
$status

# exporting a variable
set -x name 'Mister Brown'

# remove a variable
set -e name

# command substitution
echo In (pwd), running (uname)
set os (uname)

# fish also supports and, or, and not

# creating a list of two elements
set name Mister Brown

# list length
count $name

# list append
set PATH $PATH /usr/local/bin

# accessing index elements
echo $PATH[1]
echo $PATH[1..2]

# for loop
for val in $PATH
  echo "entry: $val"
end

# foor loop over a sequence of numbers
for  in (xseq 5)
  touch file_$x.txt
end

# conditionals
if grep fish /etc/shells
    echo Found fish
else if grep bash /etc/shells
    echo Found bash
else
    echo Got nothing
end

# conditionals tests
if test "$number" -gt 5
    echo $number is greater than five
else
    echo $number is five or less
end

# switch
switch (uname)
case Linux
    echo Hi Tux!
case Darwin
    echo Hi Hexley!
case FreeBSD NetBSD DragonFly
    echo Hi Beastie!
case '*'
    echo Hi, stranger!
end

# function arguments are not passed in "numbered variables" like $1, but instead in a single list $argv
function say_hello
   echo Hello $argv
end
say_hello
say_hello everybody!

# fish does not have aliases or special prompt syntax. Functions take their place.

# display all functions
functions

# while loop
while true
    echo "Loop forever"
end

# $PATH is a list, not a colon-delimited string.

# To remove /usr/local/bin from $PATH
set PATH (string match -v /usr/local/bin $PATH)

# modify the $fish_user_paths universal variable, which is automatically prepended to $PATH
set -U fish_user_paths /usr/local/bin $fish_user_paths
# run this once (NEVER in fish.config) at the command line, and it will affect the current session and all future instances too

# to modify functions interactively
funcsave
funced

# A universal variable is a variable whose value is shared across all instances of fish, now and in the future – even after a reboot
set -U EDITOR vim

# make fish the default shell
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

# Emitting events
emit my_event

# Listening events
# This lets you hook onto events, such as fish_prompt.
function myhook --on-event my_event
  ···
end
