#!/usr/bin/env bash

printf "Копирование конфигурационных файлов из home"

config_dirs=(dunst gtk-2.0 gtk-3.0 lxterminal mc mimeapps.list nano openbox picom rofi tint2)
config_files=(.zshrc .gtkrc-2.0)

for i in ${config_dirs[*]}
do
    cp -r ~/.config/$i config/$i
    printf "   %s\n" $i
done

for i in ${config_files[*]}
do
    cp -r ~/$i $i
    printf "   %s\n" $i
done