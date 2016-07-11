---
title: "Introduction to Unix"
author: "Philipp Ross"
date: July 11, 2016
---

Copy any commands directly into your terminal.

## Download data

```bash
# change to home directory
cd ~

# make a directory called workshop
mkdir workshop

# move into that directory
cd workshop

# download a file and pipe it to annotation.gff
curl -L https://www.dropbox.com/s/8xsygjp0pos1h76/annotation.gff?dl=0 > annotation.gff
```

## Moving around the shell

```bash
# what directory are you in? 
pwd

# what is inside this directory?
ls

# how do I change into one of those directories?
cd workshop

# now what am I looking at?
ls

# how do you move back a directory?
# what if I want to move back more than one directory at a time?
```

## Working with files part 1

```bash
# switch back to workshop directory
cd ~/workshop

# make an empty file
touch empty_file

# check to see what's changed
ls

# make an empty directory
mkdir empty_directory

# check to see what's changed
ls

# make a copy of the empty_file and call it something different
cp empty_file something_different

# check to see what's changed
ls

# move the empty_file into the empty directory
mv empty_file empty_directory

# what's inside the empty_directory?
ls empty_directory

# we should rename it now, right?
mv empty_directory directory_with_a_file

# how do I move into this directory and delete the file I just made?
# Hint: Use the "rm" command in combination with the ones you just learned
```

## Working with files part 2

```bash
# let's print out the file I made you download before - what do you see?
cat annotation.gff

# let's print only the start of the file
head annotation.gff

# now only the end of the file
tail annotation.gff

# let's look at the whole file at once
less annotation.gff

# finally, let's look at all of the genes in the file
grep "gene" annotation.gff
```

## Pipe all the things

```bash
# Let's do some of the above using pipes

# what if we only want to grep the first several lines of the results for "gene"
grep "gene" annotation.gff | head

# what if we only want the last results?
grep "gene" annotation.gff | tail

# let's print those results to a new file
grep "gene" annotation.gff > genes.gff

# let's check what's changed
ls
```

## Useful commands and tips

```bash
# what if a directory or file name is very long?
# we want to prevent typos and prevent carpal tunnel syndrome
# let's say we want to move into directory_with_a_file
cd dir<tab>

# This should become "cd directory_with_a_file"
# the tab key autocompletes for you to say you from typing

# What if I have a bunch of files all named the same thing?
# let's make a few more
touch file1 file2 file3

# let's see what happened now
ls

# what if I want to remove them all at once without having to retype the same first 4 letters everytime?
# we can use wildcards
rm -rf file*

# This will remove all files that start with "file" and end with anything else

# What if I forget exactly what command I just ran?
# Use the history command for that
history

# Here you can see in chronological order exactly what commands you ran during your session

# More useful commands are the following:
# sort, uniq, cut, wc, gzip, tar, find, echo, curl, wget, man
# Let's build a complex command to print only the third column, sort that column, 
# count how many unique hits we get, and sort it again in reverse order
cat annotation.gff | cut -f 3 | sort | uniq -c | sort -gr

# What do you see?
# What if we ran this just on genes.gff?
cat genes.gff | cut -f 3 | sort | uniq -c | sort -gr
```

## Writing scripts

Here is the script; copy and paste this into a text editor like Sublime and save it as "script.sh"

```bash
# This is a script that counts things

echo "How many different types of features are in my file?"
echo ""
cat annotation.gff | cut -f 3 | sort | uniq -c | sort -gr
echo ""

echo "How many genes are in my file?"
echo ""
cat genes.gff | cut -f 3 | sort | uniq -c | sort -gr
echo ""
```
This is the command you need to run the script

```bash
bash script.sh
```

## Instaling Krona

```bash
# let's switch back to our workshop directory
cd ~/workshop

# first let's download the file
curl -L https://github.com/marbl/Krona/releases/download/v2.6.1/KronaTools-2.6.1.tar > KronaTools-2.6.1.tar

# now let's unpack that file
tar xvf KronaTools-2.6.1.tar

# and change into the directory
cd KronaTools-2.6.1

# now run the following command
# to install this software in the current directory
./install.pl prefix $PWD

# now run the following to make it available as a command
echo "PATH=$PWD/bin:$PATH" >> ~/.bashrc
source ~/.bashrc

# now type the following to make sure it worked correctly
ktutil 

# if you don't get an error, it worked!
```


