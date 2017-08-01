#!/bin/bash
# while-read: read lines from a file
while read ; do
    printf "%s\n" $REPLY
done < /etc/passwd
