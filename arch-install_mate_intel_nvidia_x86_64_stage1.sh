#!/bin/sh
echo Enable MultiLib && echo [multilib] >> /etc/pacman.conf && echo Include = /etc/pacman.d/mirrorlist >> /etc/pacman.conf && echo Partition the Disk && fdisk /dev/nvme1n1 && echo Formatting Partitions && mkfs.fat -F32 /dev/nvme1n1p1 && mkswap /dev/nvme1n1p2 && mkfs.btrfs -L arch-pc /dev/nvme1n1p3 && echo Mounting Disks && swapon /dev/nvme1n1p2 && mount /dev/nvme1n1p3 /mnt && mkdir /mnt/boot && mount /dev/nvme1n1p1 /mnt/boot && echo Installing Base System && pacman -Syy && pacstrap /mnt base linux linux-firmware intel-ucode btrfs-progs net-tools networkmanager dhcpcd iwd vim man-pages man-db texinfo sudo nano base-devel intel-ucode power-profiles-daemon gstreamer systemd && echo Installing Desktop Environment && pacstrap /mnt gst-libav gst-plugins-base gst-plugins-good gst-plugins-ugly gst-plugins-bad mate mate-extra ttf-freefont lightdm lightdm-gtk-greeter gnome-terminal gnome-system-monitor vlc eom atril engrampa mate-applet-dock mate-applet-streamer mate-media blueman network-manager-applet mate-power-manager system-config-printer orca mate-netbook mate-screensavers leafpad xscreensaver archlinux-wallpaper mate-extra mozo caja marco gtk-engines gtk-engine-murrine pluma pulseaudio cpupower && echo Creating Links && genfstab -U /mnt >> /mnt/etc/fstab && echo Copying scripts to system root && cp arch-linux-installer/arch-install_mate_intel_nvidia_x86_64_stage2.sh /mnt && cp arch-linux-installer/arch-install_mate_intel_nvidia_x86_64_stage4.sh /mnt && chmod a+x arch-linux-installer/arch-install_mate_intel_nvidia_x86_64_stage3.sh && chmod a+x /mnt/arch-install_mate_intel_nvidia_x86_64_stage2.sh && chmod a+x /mnt/arch-install_mate_intel_nvidia_x86_64_stage4.sh && echo Please run the next script after typing arch-chroot /mnt
