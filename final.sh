#! /bin/bash

# "Unlock and recover vim session" script. Those of you who have been disconnected from a vim
# session probably know that when you try to get back in you are taken through a tedious proce
# ss of recovery and deleting a swap file. This script should save off the original version of 
# the file to filename.orig in the same directory where filename is the name of the original fi
# le, programmatically recover the file from the swap file and remove the swap file. It should 
# then output an sdiff between the files. This script should take the full path of the file as 
# an argument. I recommend using cp,vim -r help.txt, and sdiff.
if [ -z $1 ]
then
        echo "
        Usage: script [fileName]
        Example: script help.txt
        This script is used to recover a vim .swp file
        "
fi
filename="$1"
tempfile=".$filename.swp"
vim -u NONE -r "$tempfile" -c 'w! '"$filename"'' -c 'wq!'
