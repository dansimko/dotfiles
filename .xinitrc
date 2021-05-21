#!/bin/bash

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/*; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

if [ -f ~/.Xresources ]; then
	xrdb -merge ~/.Xresources
fi

[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

exec i3
