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

## GNOME wayland with nvidia

backup or remove the gdm udev rules, I moved them to the root
```
mv /usr/lib/udev/rules.d/61-gdm.rules /
```


## GNOME US intl keyboard

we have to add it manually with
```
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us+altgr-intl')]"
gsettings set org.gnome.desktop.input-sources xkb-options "['compose:menu','lv3:ralt_switch']"
```
now you can do accented letters (i.e áéíóú) with `altGR+<some letter>`
🤷

## Fix bootloader

With crypt and btrfs no way to use grub apparently so
```
bootctl --path=/boot install
```

# NVIDIA (for amd+nvidia)
If not using wayland (amd integrated GPU performances are still awful on wayland)
you must install `optimus-manager` and `gdm-prime` (see opt-man repo for more info)
```
paru -S optimus-manager gdm-prime
```
reboot and select nvidia with `optimus-manager --swithc nvidia`
laptop and external display should use nvidia now.


# Firefox nvidia video decoding

- Install nvidia vaapi thing
```
paru -S libva-nvidia-driver-git
```

- set envvars and firefox configs from [https://github.com/elFarto/nvidia-vaapi-driver](this)
- make sure you are using the _direct_ rendering mode `NVD_BACKEND=direct`
- either:
  - check on the nvidia settings that _Video Engine Utilization_ is ~4% on youtube (normally it's 0%)
  - check on `nvidia-smi` firefox has `C+G`, normally processes have only `G`
