#!/bin/sh
systemctl stop crond
./linux/stoptools.sh

#wc -l lsof /linux     # if they are not running then it comes back with nothing
# /ggtrail --> relocate it to a node that's not being patched and then release anything running in ggtrail