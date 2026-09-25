#!/bin/sh

export AWWW_TRANSITION_BEZIER=0.0,0.5,0.5,1.0
export AWWW_TRANSITION="fade"
export AWWW_TRANSITION_DURATION=0.500

toggle() {
    color_scheme=$(dconf read /org/gnome/desktop/interface/color-scheme)
    if [ "$color_scheme" = "'prefer-dark'" ]
    then
        dconf write /org/gnome/desktop/interface/color-scheme "\"prefer-light\"" &
        awww img ~/Pictures/F37-day.jpg -n wallpaper &
        awww img ~/Pictures/F37-day-backdrop.jpg -n backdrop
    else
        dconf write /org/gnome/desktop/interface/color-scheme "\"prefer-dark\"" &
        awww img ~/Pictures/F37-night.jpg -n wallpaper &
        awww img ~/Pictures/F37-night-backdrop.jpg -n backdrop
    fi
}

niri msg action do-screen-transition -d 150
toggle
