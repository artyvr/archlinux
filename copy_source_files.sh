#!/usr/bin/env bash

printf "Копирование конфигурационных файлов из home\n"

config_dirs=(dunst gtk-2.0 gtk-3.0 lxterminal mc mimeapps.list nano openbox picom rofi tint2)
config_files=(.zshrc .gtkrc-2.0)

for i in ${config_dirs[*]}
do
    printf "Удаляем старую папку %s\n" $i
    rm -r -f dotfiles/openbox/config/$i
    printf "Копируем новую папку %s\n" $i
    cp -r ~/.config/$i dotfiles/openbox/config/$i
    printf "\n"
done
printf "~~~~~~~~~~~\n"

for i in ${config_files[*]}
do
    printf "Удаляем старый файл %s\n" $i
    rm -r -f dotfiles/openbox/$i
    printf "Копируем новый файл %s\n" $i
    cp -r ~/$i dotfiles/openbox/$i
    printf "\n"
done
printf "~~~~~~~~~~~\n"