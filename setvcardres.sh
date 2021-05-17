#!/bin/bash

xrandr_autostart()	{
	cat >> /etc/xdg/lxsession/LXDE-pi/autostart << EOF
xrandr --output HDMI-1 --mode 1280x720
EOF
}

if grep "xrandr --output HDMI-1 --mode 1280x720" /etc/xdg/lxsession/LXDE-pi/autostart; then
	echo "vCard resolution already set to 1280x720! exiting!"
else
	if xrandr_autostart; then
		echo "vCard resolution successfully set to 1280x720."
	else
		echo "vCard resoution could NOT be set to 1280x720! Please investigate and try again!"
	fi
fi