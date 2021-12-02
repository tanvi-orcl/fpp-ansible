#!/bin/sh
cd /home/grid
./stoptools.sh >> curr_date
hostname >> curr_date


#systemctl stop crond        # stop cron job
# confirm that stopped --> check return code
#/linux/stoptools.sh  # --> check return code
#wc -l lsof /linux     # if they are not running then it comes back with nothing
# TO DO: /ggtrail --> relocate it to a node that's not being patched and then release anything running in ggtrail