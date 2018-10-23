#!/bin/bash

WORK_DIR=oldboy

create(){
    i=1
    while(($i<11))
    do
        cd $WORK_DIR && touch `tr -dc "a-z"</dev/urandom | head -c 10`_oldboy.html
        i=$(($i+1))
    done
}

check(){
    if [ -d $WORK_DIR ];
    then
        create
    else
        mkdir $WORK_DIR
        create
    fi  
}

check