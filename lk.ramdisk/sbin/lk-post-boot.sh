#!/system/bin/sh

[ -f "/system/xbin/daemonsu" ] && /system/xbin/daemonsu --auto-daemon &

setenforce 0
pm disable com.sec.knox.seandroid
