#!/bin/bash

function memory_usage() {
  read used total <<< $(free -m | awk "/$1/{printf \$2\" \"\$3}")
  percent=$(bc <<< "scale=1; 100 * $total / $used")
  echo $2 $percent"%"
}

function vpn_connection() {
  [ -d /sys/class/net/tun0 ] && printf "[]"
}

function container_count() {
  printf "󰡨 %d" $(docker ps -q | wc -l)
}

function main() {
  printf "%s %s | %s | %s" \
    "$(vpn_connection)" \
    "$(container_count)" \
    "$(memory_usage Mem )" \
    "$(memory_usage Swap 󰾴)"
}
main
