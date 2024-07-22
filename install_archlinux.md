# Шпаргалка по установке

timedatectl set-ntp true

cfdisk /dev/sdX

lsblk

mkfs.fat -F32 /dev/**~~sda1~~** (*EFI partition*)

mkfs.btrfs /dev/**~~sda3~~** (*root partition*)

mount /dev/**~~sda3~~** /mnt

mkdir /mnt/boot/efi

mount /dev/**~~sda1~~** /mnt/boot/efi

nano /etc/pacman.d/mirrorlist

pacstrap /mnt base base-devel linux linux-firmware nano mc

genfstab -U /mnt >> /mnt/etc/fstab

nano /mnt/etc/fstab 
> UUID=.........       /                btrfs  defaults,relatime,nodatacow,space_cache,ssd,ssd_spread,compress=zstd
>
> tmpfs /tmp tmpfs defaults,noatime,mode=1777 0 0
>
> tmpfs /var/log tmpfs defaults,noatime,mode=0755 0 0
>
> tmpfs /var/tmp tmpfs defaults,noatime,mode=0755 0 0
>
> tmpfs /var/cache/pacman tmpfs defaults,noatime,mode=0755 0 0


arch-chroot /mnt

ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime

hwclock --systohc

nano /etc/locale.gen 
> en_US.UTF-8
>
> ru_RU.UTF8

locale-gen

echo LANG=ru_RU.UTF-8 > /etc/locale.conf

echo namehost > /etc/hostname

nano /etc/hosts
> 127.0.0.1 localhost
>
> ::1 localhost
>
> 127.0.0.1 namehost.localdomain namehost

pacman -S networkmanager btrfs-progs

systemctl enable NetworkManager


mkinitcpio -p linux

passwd

pacman -S grub efibootmgr

grub-install --target=x86_64-efi --efi-directory=/boot/efi

grub-mkconfig -o /boot/grub/grub.cfg

mkdir /boot/efi/EFI/boot

cp /boot/efi/EFI/arch/grubx64.efi /boot/efi/EFI/boot/bootx64.efi

exit

umount -R /mnt

reboot

useradd -m -g users -G audio,video,network,wheel,storage,power -s /bin/bash art

passwd art

EDITOR=nano visudo
> %wheel ALL=(ALL) ALL

localectl set-locale lang=ru_RU.UTF8

sudo pacman -S xorg-server xorg-apps xorg-xinit git

lspci | grep -e VGA -e 3D

**AMD**

pacman -S xf86-video-amdgpu

sudo pacman -S lxdm

nano /etc/lxdm/lxdm.conf 
> session=/usr/bin/openbox-session

sudo systemctl enable lxdm.service

cp /etc/X11/xinit/xinitrc ~/.xinitrc

## Openbox
sudo pacman -S openbox ttf-font-awesome noto-fonts ttf-dejavu ttf-liberation lxterminal pcmanfm network-manager-applet numlockx alsa-lib alsa-utils pulseaudio obconf lxappearance nitrogen tint2 gvfs ntfs-3g gsimplecal galculator gparted gsmartcontrol rofi volumeicon picom zathura zathura-pdf-poppler zathura-djvu gcolor2 viewnior xarchiver freerdp tty-clock ksnip libnotify dunst eza

mkdir -p ~/.config/openbox

cp -a /etc/xdg/openbox/ ~/.config/

echo "numlockx &" >> ~/.xinitrc

echo "exec openbox" >> ~/.xinitrc

nano /etc/profile 
> export EDITOR=nano

nano /etc/X11/xorg.conf.d/00-keyboard.conf
> Section "InputClass"
>
> Identifier "system-keyboard"
>
> MatchIsKeyboard "on"
>
> Option "XkbLayout" "us,ru"
>
> Option "XkbOptions" "grp:ctrl_shift_toggle"
>
> EndSection

nano /etc/X11/xorg.conf.d/20-amdgpu.conf 
> Section "Device"
>
> Identifier "AMD"
>
> Driver "amdgpu"
>
> Option "TearFree" "true"
>
> EndSection

 
nano /etc/X11/xorg.conf.d/30-monitor.conf
> Section "ServerFlags"
>
> Option "BlankTime" "0"
>
> Option "StandbyTime" "0"
>
> Option "SuspendTime" "0"
>
> Option "OffTime" "0"
>
> Option "DPMS" "Off"
>
> EndSection

## zsh

sudo pacman -S zsh

chsh -s /usr/bin/zsh

https://github.com/ohmyzsh/ohmyzsh

https://github.com/zsh-users/zsh-syntax-highlighting

https://github.com/romkatv/powerlevel10k
