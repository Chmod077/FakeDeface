#!/bin/bash

clear
printf "\e[5;35m               _  _ _ ____ ____ ____ ____ 
               |\/| | |__/ |__/ |  | |__/ 
               |  | | |  \ |  \ |__| |  |
 
         \e[7;32mCreated by Bartes Dwiky Copyright 2019\e[0m\n\n"


printf "\e[1;92m[\e[0m\e[1;77m+\e[1;92m] Masukan Localhost :\e[0m "
read mania1


server() {

if [[ $subdomain_resp == true ]]; then

$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R '$subdomain':80:localhost:'$mania1' serveo.net  2> /dev/null > sendlink1 ' &

else
$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:'$mania1' serveo.net 2> /dev/null > sendlink ' &
fi


printf "\e[1;92m[\e[0m!\e[1;92m] \e[5;36mSedang Mendeface..\n"
sleep 8
fuser -k $mania1/tcp > /dev/null 2>&1
php -S localhost:$mania1 > /dev/null 2>&1 &

send_link=$(grep -o "https://[0-9a-z]*\.serveo.net" sendlink)
printf '\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Hasil Deface :\e[0m\e[1;77m %s\n' $send_link



}



subdomain_resp=true
printf '\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Masukan Nama Website : \e[0m' $default_subdomain
read subdomain
subdomain="${subdomain:-${default_subdomain}}"

server

send_link=$(grep -o "https://[0-9a-z]*\.serveo.net" sendlink)

sed 's+forwarding_link+'$send_link'+g' index.html > index2.html
sed 's+forwarding_link+'$send_link'+g' index.html > index.php


printf "\nTekan CTRL + X untuk menonaktifkan : "
while [ true ]; do

true

done