if [ "$HOSTNAME" = ArchAngel ]; then
	xrandr | grep 1920x1080
	if [ $? -eq 0 ]; then
		xrandr --output "HDMI-2" --primary --mode 1920x1080
	else
		xrandr --output "HDMI-2" --primary
	fi
fi

if [ "$HOSTNAME" = ArchDiamond ]; then
	xrandr | grep 2560x1440
	if [ $? -eq 0 ]; then
		xrandr \
			--output "DP-1" --mode 2560x1440 --primary \
			--output "DP-3" --mode 1920x1080 --left-of "DP-1" \
			--output "DP-2" --mode 1440x900 --right-of "DP-1"
	fi
fi

if [ "$HOSTNAME" = ArchMajestic ]; then
	xrandr --output "DP-4" --primary \
		--output "DP-0" --right-of "DP-4" \
		--output "HDMI-0" --below "DP-0" \
		--output "DP-2" --right-of "DP-0"
fi
