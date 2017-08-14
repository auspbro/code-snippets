#!/bin/bash

File=/etc/fstab

if cmp a b &> /dev/null
	then echo "Files a and b are identical."
else echo "Fiels a and b differ."
fi


exit 0
