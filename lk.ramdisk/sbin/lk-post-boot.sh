#!/system/bin/sh

[ ! -d "/data/data/leankernel" ] && mkdir /data/data/leankernel
chmod 755 /data/data/leankernel
#
# panel temperature setting
#
PANELTMP="/data/data/leankernel/paneltemp"
PANELSF="/sys/class/lcd/panel/temperature"
[ -f $PANELTMP ] && echo `cat $PANELTMP` > $PANELSF
#
# panel color control
#
PANELCLR="/data/data/leankernel/panelcolor"
PANELSF="/sys/class/lcd/panel/panel_colors"
[ -f $PANELCLR ] && echo `cat $PANELCLR` > $PANELSF

# daemonsu support - probably not needed
[ -f "/system/xbin/daemonsu" ] && /system/xbin/daemonsu --auto-daemon &

pm disable com.sec.knox.seandroid

/system/xbin/busybox run-parts /system/etc/init.d

stop thermal-engine
sleep 2
start thermal-engine
