#!/bin/bash

function memory_usage() {
  read used total <<< $(free -m | awk '/Mem/{printf $2" "$3}')
  percent=$((100 * $total / $used))
  printf ' %.1f%%' $percent
}

function vpn_connection() {
  [ -d /sys/class/net/tun0 ] && printf "VPN"
}

function container_count() {
  printf "󰡨 %d" $(docker ps -q | wc -l)
}

function main() {
  printf "%s | %s" \
    "$(container_count)" \
    "$(memory_usage)"
}
main
