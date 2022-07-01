#!/bin/bash

##### FUNCTIONS #####

make_10in_script_executable()	{
chmod +x /home/pi/enable-10in-monitor.sh
}

make_auto_monitor_script_executable()	{
chmod +x /home/pi/enable-auto-monitor.sh
}

create_10in_script()    {
cat >> /home/pi/enable-10in-monitor.sh << END
#!/bin/bash
sed -i '/xrandr --output HDMI-1 --auto/d' /etc/xdg/lxsession/LXDE-pi/autostart
sed -i '/xrandr --output HDMI-1 --mode 1280x720/d' /etc/xdg/lxsession/LXDE-pi/autostart
cat >> /etc/xdg/lxsession/LXDE-pi/autostart << EOF
xrandr --output HDMI-1 --mode 1280x720
EOF
END
}

create_auto_monitor_script()    {
cat >> /home/pi/enable-auto-monitor.sh << END
#!/bin/bash
sed -i '/xrandr --output HDMI-1 --mode 1280x720/d' /etc/xdg/lxsession/LXDE-pi/autostart
sed -i '/xrandr --output HDMI-1 --auto/d' /etc/xdg/lxsession/LXDE-pi/autostart
cat >> /etc/xdg/lxsession/LXDE-pi/autostart << EOF
xrandr --output HDMI-1 --auto
EOF
END
}



##### START OF SCRIPT #####

if [ -e /home/pi/enable-10in-monitor.sh ]; then
	echo "enable-10in-monitor.sh script already installed. Skipping."
else
	echo "enable-10in-monitor.sh script NOT installed. Need to create."
	if create_10in_script; then
		echo "Create enable-10in-monitor.sh successful."
		if make_10in_script_executable; then
			echo "enable-10in-monitor.sh executable."
		else
			echo "enable-10in-monitor.sh NOT executable!"
		fi
	else
		echo "Create enable-10in-monitor.sh NOT successful! Please investigate."
	fi
fi

if [ -e /home/pi/enable-auto-monitor.sh ]; then
	echo "enable-auto-monitor.sh script already installed. Skipping."
else
	echo "enable-auto-monitor.sh script NOT installed. Need to create."
	if create_auto_monitor_script; then
		echo "Create enable-auto-monitor.sh successful."
		if make_auto_monitor_script_executable script; then
			echo "enable-auto-monitor.sh executable."
		else
			echo "enable-auto-monitors.sh NOT executable!"
		fi
	else
		echo "Create enable-auto-monitor.sh NOT successful!. Please investigate."
	fi
fi
