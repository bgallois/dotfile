#!/bin/env sh

SCRIPTPATH="$( cd "$(dirname "$0")" || return ; pwd -P )"

pkill polybar

sleep 1;

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar -c "$SCRIPTPATH"/config&
  done
else
  polybar -c "$SCRIPTPATH"/config&
fi
