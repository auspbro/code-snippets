#!/bin/bash
#rpm-check.sh

#This script released to description, list & confirm if could be install 
# a rpm package
#Output to a log.

SUCCESS=0
E_NOARGS=65

if [ -z "$1"]
then
