#!/bin/bash

IMAGE=$(find $HOME/Pictures/wallpapers/ -type f | shuf -n 1)
THEME="powerarrow-dark"
cp -f $IMAGE $HOME/.config/awesome/themes/$THEME/wall.png
