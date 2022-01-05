# Setup guide

## Dotfiles
### Dependencies
- curl
- git
- zsh

```Bash
curl https://raw.githubusercontent.com/mio-me/dotfiles/main/script/bootstrap.sh | sh
```
## Install basic software
Replace `yay` with correct package manager
```Bash
yay -S $(curl https://raw.githubusercontent.com/mio-me/dotfiles/main/.myconf/base.txt | tr '\n' ' ')
```

## Debian unstable
Add to `/etc/apt/sources.list`
```
deb http://deb.debian.org/debian unstable main
```

## Fonts
```Bash
mkdir /usr/share/fonts/<name>
cp /path/to/fonts/* /usr/share/fonts/<name>/
chmod 644 /usr/share/fonts/<name>/*
fc-cache --force
```

## gdrive
```Bash
yay -S drive-bin
drive init ~/gdrive
```

## awesome
```Bash
pacman -S xorg-server awesome nitrogen picom
localectl set-x11-keymap de
```

## Arch
```Bash
# Keyboard
loadkeys de-latin1
# verify boot mode
ls /sys/firmware/efi/efivars
# wifi
iwctl --passphrase <passphrase> station <device> connect <SSID>
# system clock
timedatectl set-ntp true
# filesystem
fdisk /dev/sdx
mkfs.fat -F32 /dev/<efi>
mkfs.ext4 /dev/<root>
mkswap /dev/<swap>
swapon
# mount
mount /dev/<root> /mnt
pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
#
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc
nvim /etc/locale.gen # uncomment local
locale-gen
nvim /etc/locale.conf # LANG=en_US.UTF-8
nvim /etc/vconsole.conf # KEYMAP=de-latin1
nvim /etc/hostname # hostname
```

nvim /etc/hosts
```Bash
127.0.0.1	localhost
::1		localhost
127.0.1.1	myhostname.localdomain	myhostname
```

```Bash
passwd
useradd -m <user>
passwd <user>
usermod -aG wheel,audio,video,optical,storage,... <user>
pacman -S sudo
EDITOR=nvim visudo #uncomment wheel
```

```Bash
pacman -S grub efibootmgr dosfstools os-prober mtools
mkdir /boot/EFI
mount /dev/<efi> /boot/EFI
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
grub-mkconfig -o /boot/grub/grub.cfg
```

```Bash
pacman -S networkmanager git
systemctl enable NetworkManager
exit
umount -R /mnt
```
