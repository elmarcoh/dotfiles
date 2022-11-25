# ArchLinux install notes

## Open encrypted partition

```
cryptsetup luksOpen /dev/nvme0n1p2 root
```
this creates `/dev/mapper/root`

```
mount -o subvolume=@ /dev/mapper/root /mnt
```


BTRFS mount w/options:
```
mount -o noatime,space_cache=v2,compress=zstd,ssd,discard=async,subvol=@ /dev/mapper/root /mnt
```


## GNOME US intl keyboard

we have to add it manually with
```
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us+altgr-intl')]"
gsettings set org.gnome.desktop.input-sources xkb-options "['compose:menu','lv3:ralt_switch']"
```
🤷

## Fix bootloader

With crypt and btrfs no way to use grub apparently so
```
bootctl --path=/boot install
```
