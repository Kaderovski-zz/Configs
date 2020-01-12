#!/bin/bash
# author : F00b4rch
# descr : Make your wallpaper change on each start !
#
# I'm using Luck Smith wallpaper git repo for all images
# link : https://github.com/LukeSmithxyz/wallpapers

# current awesome theme
THEME="powerarrow-dark"

# image should have absolute path to image folder
IMAGE=$(find $HOME/Pictures/wallpapers/ -type f | shuf -n 1 | sed 's/\ /\\ /g') && cp -f $IMAGE $HOME/.config/awesome/themes/$THEME/wall.png

# don't forget to add those lines at the end of your rc.lua (replace with your correct path and script name)
#
# -- Startup programs
# awful.util.spawn_with_shell("~/bin/wallpaper.sh")
