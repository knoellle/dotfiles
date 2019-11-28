#!/bin/sh
xss-lock --ignore-sleep -- locknow &
#redshift-gtk &
mpd
compton-restart
spawn
setxkbmap us cz_sk_de

# fix polkit stuff
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh &

# start aliveness receiver
/home/mystery/hulks/nao/scripts/alivenessReceiver.py &

# set default wm here
if [ "$2" == "" ] ; then
	wm="dwm"
else
	wm="$2"
fi

# start selected wm
echo "Starting $wm"
if [ "$wm" == "i3" ] ; then
	exec i3 >> ~/.cache/i3log
elif [ "$wm" == "dwm" ] ; then
	# relaunch DWM if the binary changes, otherwise bail
	csum=$(sha1sum $(which dwm))
	new_csum=""
	while true
	do
		if [ "$csum" != "$new_csum" ] ; then
			csum=$new_csum
			dwm >> ~/.cache/dwmlog
		else
			exit 0
		fi
		new_csum=$(sha1sum $(which dwm))
		sleep 0.5
	done
elif [ "$wm" == "awesome" ] ; then
	exec awesome >> ~/.cache/awesome/log 2>> ~/.cache/awesome/err
fi
