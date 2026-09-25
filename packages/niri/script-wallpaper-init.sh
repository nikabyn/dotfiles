#!/bin/sh

export AWWW_TRANSITION_BEZIER=0.0,0.0,1.0,1.0
export AWWW_TRANSITION="fade"
export AWWW_TRANSITION_DURATION=0.100

color_scheme=$(dconf read /org/gnome/desktop/interface/color-scheme)
if [ "$color_scheme" = "'prefer-dark'" ]
then
    awww img ~/Pictures/F37-night.jpg -n wallpaper &
    awww img ~/Pictures/F37-night-backdrop.jpg -n backdrop
else
    awww img ~/Pictures/F37-day.jpg -n wallpaper &
    awww img ~/Pictures/F37-day-backdrop.jpg -n backdrop
fi
