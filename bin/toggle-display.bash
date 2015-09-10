#!/bin/bash

CLIENT_MAC=00:00:00:00:00:00
CLIENT_IP=192.168.1.XXX # a static IP for the client
CLIENT_USER=user # we use this to login to the client through ssh

# wake up the client. Only necessary if you want to let it sleep when idle.
#wol $CLIENT_MAC

# TOGGLE=$HOME/.display_toggler
# if [ ! -e $TOGGLE ]; then 
# 	touch $TOGGLE
# 	# xrandr --output DVI-I-1 --off
#         sleep 1
#         xset dpms force off
# 	# ssh -ft $CLIENT_USER@$CLIENT_IP "sudo pmset force -a displaysleep 0"
# else
# 	rm $TOGGLE
# 	MAGIC_NUMBER=2147483648 # gives pmset a seizure, causing the video output to terminate 
# 	# xrandr --output DVI-I-1 --auto
#         xset dpms force on
# 	# ssh -ft $CLIENT_USER@$CLIENT_IP "sudo pmset force -a displaysleep $MAGIC_NUMBER"
# fi


# the host appears to have lost or gained a monitor, so we need to inform Synergy of this
# sudo /etc/rc.d/synergys restart

sleep 1
xset dpms force off
