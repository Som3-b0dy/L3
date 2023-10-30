#!/bin/bash

echo -e """$first_column""HOSTNAME$reset_color = $second_column$(hostname)$reset_color"
# sudo nano /etc/wsl.conf
# [boot]
# systemd=true

time_zone_1=$(timedatectl | grep --color=never -oP '(?<=Time zone: )[^(]*')
UTC=$(timedatectl | grep --color=never -oP '(?<=, )[^)]*' | sed 's/0//g')
echo -e """$first_column""TIMEZONE$reset_color = $second_column${time_zone_1}UTC${UTC}$reset_color"

echo -e """$first_column""USER$reset_color = $second_column$(whoami)$reset_color"

os_version=$(grep --color=never -oP '(?<=PRETTY_NAME=")[^"]*' /etc/os-release)
echo -e """$first_column""OS$reset_color = $second_column$os_version$reset_color"

sys_date=$(date | awk '{print $3, $2, $6, $4}')
echo -e """$first_column""DATE$reset_color = $second_column$sys_date$reset_color"

echo -e """$first_column""UPTIME$reset_color = $second_column$(uptime -p)$reset_color"

sys_uptime_sec=$(awk '{print $1}' /proc/uptime)
echo -e """$first_column""UPTIME_SEC$reset_color = $second_column$sys_uptime_sec$reset_color"

ip_1=$(ip a | grep -A 2 BROADCAST,MULTICAST,UP,LOWER_UP | tail -n 1 | grep --color=never -oP '(?<=inet )[^b]*')
echo -e """$first_column""IP$reset_color = $second_column$ip_1$reset_color"

netmask=$(ipcalc $ip_1 | grep Netmask | awk '{print $2}')
echo -e """$first_column""MASK$reset_color = $second_column$netmask$reset_color"

gateway=$(ip r | grep --color=never -oP '(?<=via )[^dev]*')
echo -e """$first_column""GATEWAY$reset_color = $second_column$gateway$reset_color"

ram_total=$(free --mega | awk 'FNR == 2 {printf $2}')
if [ "$ram_total" -lt 1000 ];then
    ram_total=$(printf "%04d" "$ram_total")
fi
ram_total=$(echo "$ram_total" | sed 's/\(.\)\(.*\)/\1.\2/')
echo -e """$first_column""RAM_TOTAL$reset_color = $second_column$ram_total GB$reset_color"

ram_used=$(free --mega | awk 'FNR == 2 {printf $3}')
if [ "$ram_used" -lt 1000 ];then
    ram_used=$(printf "%04d" "$ram_used")
fi
ram_used=$(echo "$ram_used" | sed 's/\(.\)\(.*\)/\1.\2/')
echo -e """$first_column""RAM_USED$reset_color = $second_column$ram_used GB$reset_color"

ram_free=$(free --mega | awk 'FNR == 2 {printf $4}')
if [ "$ram_free" -lt 1000 ];then
    ram_free=$(printf "%04d" "$ram_free")
fi
ram_free=$(echo "$ram_free" | sed 's/\(.\)\(.*\)/\1.\2/')
echo -e """$first_column""RAM_FREE$reset_color = $second_column$ram_free GB$reset_color"

space_total=$(df / | awk 'FNR == 2 {printf "%.2f", $2 / 1024}')
echo -e """$first_column""SPACE_ROOT$reset_color = $second_column$space_total MB$reset_color"

space_used=$(df / | awk 'FNR == 2 {printf "%.2f", $3 / 1024}')
echo -e """$first_column""SPACE_ROOT_USED$reset_color = $second_column$space_used MB$reset_color"

space_free=$(df / | awk 'FNR == 2 {printf "%.2f", $4 / 1024}')
echo -e """$first_column""SPACE_ROOT_FREE$reset_color = $second_column$space_free MB$reset_color"

./color_output.sh "$column1_background" "$column1_font_color" "$column2_background" "$column2_font_color"
