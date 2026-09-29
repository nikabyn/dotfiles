#!/bin/sh

echo $PATH

export AWWW_TRANSITION="none"
export AWWW_TRANSITION_DURATION=0
export DELAY=750

color_scheme=$(dconf read /org/gnome/desktop/interface/color-scheme)
if [ "$color_scheme" = "'prefer-dark'" ]
then
    niri msg action do-screen-transition -d $DELAY
    awww img ~/Pictures/F37-night.jpg -n wallpaper &
    awww img ~/Pictures/F37-night-backdrop.jpg -n backdrop
else
    niri msg action do-screen-transition -d $DELAY
    awww img ~/Pictures/F37-day.jpg -n wallpaper &
    awww img ~/Pictures/F37-day-backdrop.jpg -n backdrop
fi
