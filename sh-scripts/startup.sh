#!/bin/bash

# Supports desktop files, so handled by systemd or dex:
# * xfce power manager
# * nm applet
#
# dropbox no longer, started manually

WS1="1: Aleph"
WS2="2: Bet"
WS3="3: Gimel"
WS4="4: Dalet"
WS5="5: Hei"
WS6="6: Vav"
WS7="7: Zayin"
WS8="8: Het"
WS9="9: Tet"
WS0="10: Yod"

xss-lock -n ~/dotfiles/sh-scripts/lock-warning.sh -- ~/dotfiles/sh-scripts/fuzzy-lock.sh &

if [ "$HOSTNAME" = ArchAngel ]; then
	picom -C -G -b --no-fading-openclose
	redshift-gtk &
	dropbox-cli start
fi

if [ "$HOSTNAME" = ArchScythe ]; then
	picom -C -G -b --no-fading-openclose
	redshift-gtk &
	dropbox-cli start
	systemctl --user start mbsync.timer # idfk why systemctl enable doesn't work w/e
	dunst &
	syncthing-gtk -m &
fi

if [ "$HOSTNAME" = ArchDiamond ]; then
	picom -C -G -b --no-fading-openclose
	redshift-gtk &
	dropbox-cli start
	systemctl --user start mbsync.timer
	dunst &
	syncthing-gtk -m &
	if [ "$(whoami)" = "evan" ]; then
		/home/evan/dotfiles/py-scripts/ctwenty.py &
		ibus-daemon -d -r &
	fi
	xrandr | grep 2560x1440
	if [ $? -eq 0 ]; then
		i3-msg workspace $WS2
		i3-msg workspace $WS9
		i3-msg move workspace to "DP-1"
		i3-msg workspace $WS2
		i3-msg workspace $WS1
		i3-msg move workspace to "DP-3"
	fi
	i3-msg gaps right current set 390
	sleep 5 && conky -c ~/dotfiles/conky/conky.conf; conky -c ~/dotfiles/conky/huge-calendar.conf
fi

if [ "$HOSTNAME" = ArchMajestic ]; then
	picom -b &
	if [ "$(whoami)" = "evan" ]; then
		/home/evan/dotfiles/py-scripts/ctwenty.py &
		qtalarm &
		ibus-daemon -d -r &
	fi
	redshift-gtk &
	dropbox-cli start
	syncthing-gtk &
	i3-msg workspace $WS9
	i3-msg move workspace to "DP-1"
	i3-msg workspace $WS1
	i3-msg move workspace to "DP-4"
	i3-msg workspace $WS7
	i3-msg move workspace to "HDMI-0"
fi

pacman -Qen > ~/Sync/Misc/pacman/$(hostname).paclist
pacman -Qem >> ~/Sync/Misc/pacman/$(hostname).paclist
