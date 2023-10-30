#!/bin/bash

echo "HOSTNAME = $(hostname)"
# sudo nano /etc/wsl.conf
# [boot]
# systemd=true

time_zone_1=$(timedatectl | grep --color=never -oP '(?<=Time zone: )[^(]*')
UTC=$(timedatectl | grep --color=never -oP '(?<=, )[^)]*' | sed 's/0//g')
echo "TIMEZONE = ${time_zone_1}UTC${UTC}"

echo "USER = $(whoami)"

os_version=$(grep --color=never -oP '(?<=PRETTY_NAME=")[^"]*' /etc/os-release)
echo "OS = $os_version"

sys_date=$(date | awk '{print $3, $2, $6, $4}')
echo "DATE = $sys_date"

echo "UPTIME = $(uptime -p)"

sys_uptime_sec=$(awk '{print $1}' /proc/uptime)
echo "UPTIME_SEC = $sys_uptime_sec"

ip_1=$(ip a | grep -A 2 BROADCAST,MULTICAST,UP,LOWER_UP | tail -n 1 | grep --color=never -oP '(?<=inet )[^b]*')
echo "IP = $ip_1"

netmask=$(ipcalc $ip_1 | grep Netmask | awk '{print $2}')
echo "MASK = $netmask"

gateway=$(ip r | grep --color=never -oP '(?<=via )[^dev]*')
echo "GATEWAY = $gateway"

ram_total=$(free --mega | awk 'FNR == 2 {printf $2}')
if [ "$ram_total" -lt 1000 ];then
    ram_total=$(printf "%04d" "$ram_total")
fi
ram_total=$(echo "$ram_total" | sed 's/\(.\)\(.*\)/\1.\2/')
echo "RAM_TOTAL = $ram_total GB"

ram_used=$(free --mega | awk 'FNR == 2 {printf $3}')
if [ "$ram_used" -lt 1000 ];then
    ram_used=$(printf "%04d" "$ram_used")
fi
ram_used=$(echo "$ram_used" | sed 's/\(.\)\(.*\)/\1.\2/')
echo "RAM_USED = $ram_used GB"

ram_free=$(free --mega | awk 'FNR == 2 {printf $4}')
if [ "$ram_free" -lt 1000 ];then
    ram_free=$(printf "%04d" "$ram_free")
fi
ram_free=$(echo "$ram_free" | sed 's/\(.\)\(.*\)/\1.\2/')
echo "RAM_FREE = $ram_free GB"

space_total=$(df / | awk 'FNR == 2 {printf "%.2f", $2 / 1024}')
printf "SPACE_ROOT = %.2f MB\n" "$space_total"

space_used=$(df / | awk 'FNR == 2 {printf "%.2f", $3 / 1024}')
printf "SPACE_ROOT_USED = %.2f MB\n" "$space_used"

space_free=$(df / | awk 'FNR == 2 {printf "%.2f", $4 / 1024}')
printf "SPACE_ROOT_FREE = %.2f MB\n" "$space_free"

if [[ $(ls | wc -l) -ne 2 ]];then
    exit 0
else
    ./file_save.sh
fi