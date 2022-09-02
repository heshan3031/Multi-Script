#!/bin/bash
# Si llegaste hasta aqui, No Reproduscas Copias de este ADM
# ERES ADMIRABLE, al lograr llegar hasta aqui
# Moded creado por @ChumoGH
rm -f PlusCGH* && rm -rf /tmp/*
SCPdir="/etc/ADMcgh"
SCPinstal="$HOME/install"
act_ufw() {
[[ -f "/usr/sbin/ufw" ]] && ufw allow 81/tcp ; ufw allow 8888/tcp
}
cd && cd $HOME && cd
echo "nameserver	1.1.1.1" > /etc/resolv.conf
echo "nameserver	1.0.0.1" >> /etc/resolv.conf
killall apt apt-get &> /dev/null
rm -f instala.* > /dev/null
[[ $(dpkg --get-selections|grep -w "gawk"|head -1) ]] || apt-get install gawk -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "mlocate"|head -1) ]] || apt-get install mlocate -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "boxes"|head -1) ]] || apt-get install boxes -y &>/dev/null
source <(curl -sL https://raw.githubusercontent.com/ChumoGH/ChumoGH-Script/master/msg-bar/msg) > /dev/null
fun_ip () {
MIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
MIP2=$(wget -qO- ipv4.icanhazip.com)
[[ "$MIP" != "$MIP2" ]] && IP="$MIP2" || IP="$MIP"
}

fun_barin () {
#==comando a ejecutar==
comando="$1"
#==interfas==
in=' ['
en=' ] '
full_in="➛"
full_en='100%'
bar=(────────────────────
═───────────────────
▇═──────────────────
▇▇═─────────────────
═▇▇═────────────────
─═▇▇═───────────────
──═▇▇═──────────────
───═▇▇═─────────────
────═▇▇═────────────
─────═▇▇═───────────
──────═▇▇═──────────
───────═▇▇═─────────
────────═▇▇═────────
─────────═▇▇═───────
──────────═▇▇═──────
───────────═▇▇═─────
────────────═▇▇═────
─────────────═▇▇═───
──────────────═▇▇═──
───────────────═▇▇═─
────────────────═▇▇═
─────────────────═▇▇
──────────────────═▇
───────────────────═
──────────────────═▇
─────────────────═▇▇
────────────────═▇▇═
───────────────═▇▇═─
──────────────═▇▇═──
─────────────═▇▇═───
────────────═▇▇═────
───────────═▇▇═─────
──────────═▇▇═──────
─────────═▇▇═───────
────────═▇▇═────────
───────═▇▇═─────────
──────═▇▇═──────────
─────═▇▇═───────────
────═▇▇═────────────
───═▇▇═─────────────
──═▇▇═──────────────
─═▇▇═───────────────
═▇▇═────────────────
▇▇═─────────────────
▇═──────────────────
═───────────────────
────────────────────);
#==color==
in="\033[1;33m$in\033[0m"
en="\033[1;33m$en\033[0m"
full_in="\033[1;31m$full_in"
full_en="\033[1;32m$full_en\033[0m"

 _=$(
$comando > /dev/null 2>&1
) & > /dev/null
pid=$!
while [[ -d /proc/$pid ]]; do
	for i in "${bar[@]}"; do
		echo -ne "\r $in"
		echo -ne "ESPERE $en $in \033[1;31m$i"
		echo -ne " $en"
		sleep 0.1
	done
done
echo -e " $full_in $full_en"
sleep 0.1s
}

fun_install () {
clear
[[  -e ${SCPinstal}/v-local.log ]] && vv="$(less ${SCPinstal}/v-local.log)" || vv="NULL"
valid_fun
msg -bar3
[[ -e $HOME/lista-arq ]] && rm $HOME/lista-arq  
[[ -e $HOME/lista ]] && rm $HOME/lista   
[[ -d ${SCPinstal} ]] && rm -rf ${SCPinstal} 
[[ -e /etc/ADMcgh/baseINST ]] &&  rm -f /etc/ADMcgh/baseINST
[[ -d /bin/ejecutar ]] && {
echo -e "$pkrm" > /bin/ejecutar/key.fix > /dev/null  && echo -e "\033[1;32m [ Key Restaurada del Generador Exitosamente ]"
} || echo -e "\033[1;31m [ Deleting Key ]"
exit
}

fecha=`date +"%d-%m-%y"`;
## root check
if ! [ $(id -u) = 0 ]; then
clear
		echo ""
		echo -e "•••••••••••••••••••••••••••••••••••••••••••••••••" 
		echo " 	           	⛑⛑⛑     Error Fatal!! x000e1  ⛑⛑⛑"
		echo -e "•••••••••••••••••••••••••••••••••••••••••••••••••" 
		echo "                    ✠ Este script debe ejecutarse como root! ✠"

		echo "                              Como Solucionarlo "
		
		echo "                            Ejecute el script así:"
		echo "                               ⇘     ⇙ "
		echo "                                   sudo -i "
		echo "                                   sudo su"
		echo "                                 Retornando . . ."
		echo $(date)
		echo -e "•••••••••••••••••••••••••••••••••••••••••••••••••" 
		exit
fi
update_pak () {
[[ -z $(dpkg --get-selections|grep -w "pv"|head -1) ]] && apt install pv -y -qq --silent > /dev/null 2>&1
[[ -z $(dpkg --get-selections|grep -w "lolcat"|head -1) ]] && apt install lolcat -y &>/dev/null
[[ -z $(dpkg --get-selections|grep -w "figlet"|head -1) ]] && apt-get install figlet -y -qq --silent > /dev/null 2>&1
}




fun_bar () {
comando[0]="$1"
comando[1]="$2"
 (
[[ -e $HOME/fim ]] && rm $HOME/fim
${comando[0]} -y > /dev/null 2>&1
${comando[1]} -y > /dev/null 2>&1
touch $HOME/fim
 ) > /dev/null 2>&1 &
echo -ne "\033[1;33m ["
while true; do
   for((i=0; i<18; i++)); do
   echo -ne "\033[1;31m►"
   sleep 0.1s
   done
   [[ -e $HOME/fim ]] && rm $HOME/fim && break
   echo -e "\033[1;33m]"
   sleep 0.5s
   tput cuu1
   tput dl1
   echo -ne "\033[1;33m ["
done
echo -e "\033[1;33m]\033[1;31m -\033[1;32m 100%\033[1;37m"
}
msg -bar3
echo -e " \033[0;33m ESPERE - SALTANDO SOURCES DE APT"
fun_barin 'update_pak'

