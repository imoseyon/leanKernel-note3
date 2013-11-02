#!/system/bin/sh

[ ! -d "/data/data/leankernel" ] && mkdir /data/data/leankernel
chmod 755 /data/data/leankernel
#
# panel temperature setting
#
PANELTMP="/data/data/leankernel/paneltemp"
PANELTMPSF="/sys/devices/qcom,mdss_dsi_samsung_octa_1080p_cmd.71/lcd/panel/temperature"
[ -f $PANELTMP ] && echo `cat $PANELTMP` > $PANELTMPSF

# daemonsu support - probably not needed
[ -f "/system/xbin/daemonsu" ] && /system/xbin/daemonsu --auto-daemon &

pm disable com.sec.knox.seandroid

/system/xbin/busybox run-parts /system/etc/init.d

stop thermal-engine
sleep 2
start thermal-engine
