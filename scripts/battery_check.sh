BATTERY_THRESHOLD=10
NOTIFICATION_FLAG="/run/user/$UID/battery_notified"
BATTERY_LEVEL=$(bash /home/olegsea/flake/scripts/battery_remaining.sh)
BATTERY_STATE=$(upower -i $(upower -e | grep 'BAT') | grep -E "state" | awk '{print $2}')

send_notification() {
  notify-send -u critical "󱐋 Time to recharge!" "Battery is down to ${1}%" -i battery-caution -t 30000
}

if [[ $BATTERY_STATE == "discharging" && $BATTERY_LEVEL -le $BATTERY_THRESHOLD ]]; then
  if [[ ! -f $NOTIFICATION_FLAG ]]; then
    send_notification $BATTERY_LEVEL
    touch $NOTIFICATION_FLAG
  fi
else
  rm -f $NOTIFICATION_FLAG
fi
