cvt 3200 1800
xrandr --newmode "3200x1800_60.00"  492.00  3200 3456 3800 4400  1800 1803 1808 1865 -hsync +vsync
sleep 2
xrandr --addmode VIRTUAL1 "3200x1800_60.00"
sleep 2
xrandr --output VIRTUAL1 --mode "3200x1800_60.00"
sleep 2
