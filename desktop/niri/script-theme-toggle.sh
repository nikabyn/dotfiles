#!/bin/sh

toggle() {
    color_scheme=$(dconf read /org/gnome/desktop/interface/color-scheme)
    if [ "$color_scheme" = "'prefer-dark'" ]
    then
        dconf write /org/gnome/desktop/interface/color-scheme "\"prefer-light\""
    else
        dconf write /org/gnome/desktop/interface/color-scheme "\"prefer-dark\""
    fi
}

niri msg action do-screen-transition -d 150
toggle
