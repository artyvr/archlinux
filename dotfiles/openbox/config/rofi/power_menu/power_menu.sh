#!/usr/bin/env bash

dir="$HOME/.config/rofi/power_menu/style.rasi"

shutdown=' Выключить'
reboot=' Перезагрузка'
logout=' Выход'
yes=' Да'
no=' Нет'

rofi_cmd() {
	rofi -dmenu -i -theme ${dir}
}

confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 200px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Ты уверен?' \
		-theme ${dir}
}

confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

run_rofi() {
	echo -e "$logout\n$reboot\n$shutdown" | rofi_cmd
}

run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
			systemctl poweroff
		elif [[ $1 == '--reboot' ]]; then
			systemctl reboot
		elif [[ $1 == '--logout' ]]; then
			openbox --exit
		fi
	else
		exit 0
	fi
}

chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
		run_cmd --shutdown
        ;;
    $reboot)
		run_cmd --reboot
        ;;
    $logout)
		run_cmd --logout
        ;;
esac
