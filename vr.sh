#Do if on X11
#./set3200.sh
#./Downloads/Immersed-x86_64.AppImage
#./set1920.sh

#Do if on Wayland
#gnome-extensions disable compiz-windows-effect@hermes83.github.com
#./Downloads/Immersed-x86_64.AppImage
#gnome-extensions enable compiz-windows-effect@hermes83.github.com


#!/bin/bash

if [ "$XDG_SESSION_TYPE" = "x11" ]; then
    # Do if on X11
    ./set3200.sh
    ./Downloads/Immersed-x86_64.AppImage
    #./set1920.sh
    xrandr --output eDP1 --off && xrandr --output eDP1 --mode 1920x1080
    sleep 1
    xrandr --output VIRTUAL1 --off
    sleep 1
    xrandr --delmode VIRTUAL1 "3200x1800_60.00"
    sleep 1
    xrandr --rmmode "3200x1800_60.00"
    sleep 1
    xrandr --output eDP1 --off && xrandr --output eDP1 --mode 1920x1080
elif [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    # Do if on Wayland
    gnome-extensions disable compiz-windows-effect@hermes83.github.com
    #export LIBVA_DRIVER_NAME=i965
    ./Downloads/Immersed-x86_64.AppImage
    gnome-extensions enable compiz-windows-effect@hermes83.github.com
else
    echo "Unknown session type: $XDG_SESSION_TYPE"
fi

