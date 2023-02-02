#!/bin/sh
# xss-lock --ignore-sleep -- locknow &
/usr/lib/geoclue-2.0/demos/agent &
# mpd
spawn
setxkbmap us cz_sk_de
nm-applet &
fusuma &
numlockx &
xss-lock -l -- locknow &
ckb-next -b &
noisetorch -i &

# fix polkit stuff
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh &

./.screenlayout/default.sh &!

# set default wm here
if [ "$2" == "" ] ; then
	wm="awesome"
else
	wm="$2"
fi

# start selected wm
echo "Starting $wm"
if [ "$wm" == "i3" ] ; then
	exec i3 >> ~/.cache/i3log
elif [ "$wm" == "dwm" ] ; then
	dwmbar &
	sxhkd &
	# relaunch DWM if the binary changes, otherwise bail
	csum=$(sha1sum $(which dwm))
	new_csum=""
	while true
	do
		if [ "$csum" != "$new_csum" ] ; then
			dwm >> ~/.cache/dwmlog
		else
			exit 0
		fi
        csum=$new_csum
		new_csum=$(sha1sum $(which dwm))
		sleep 0.5
	done
elif [ "$wm" == "qtile" ] ; then
	exec qtile start
elif [ "$wm" == "awesome" ] ; then
	exec awesome >> ~/.cache/awesome/log 2>> ~/.cache/awesome/err
fi
