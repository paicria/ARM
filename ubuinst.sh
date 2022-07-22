#!/bin/bash
apt-get install lolcat -y &>/dev/null
apt-get install figlet -y &>/dev/null
apt-get install curl -y &>/dev/null
apt install pv -y &>/dev/null
apt install boxes -y &>/dev/null
function msg {
  BRAN='\033[1;37m' && RED='\e[31m' && GREEN='\e[32m' && YELLOW='\e[33m'
  BLUE='\e[34m' && MAGENTA='\e[35m' && MAG='\033[1;36m' && BLACK='\e[1m' && SEMCOR='\e[0m'
  case $1 in
  -ne) cor="${RED}${BLACK}" && echo -ne "${cor}${2}${SEMCOR}" ;;
  -ama) cor="${YELLOW}${BLACK}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -verm) cor="${YELLOW}${BLACK}[!] ${RED}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -azu) cor="${MAG}${BLACK}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -verd) cor="${GREEN}${BLACK}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -bra) cor="${RED}" && echo -ne "${cor}${2}${SEMCOR}" ;;
  -nazu) cor="${COLOR[6]}${BLACK}" && echo -ne "${cor}${2}${SEMCOR}" ;;
  -gri) cor="\e[5m\033[1;100m" && echo -ne "${cor}${2}${SEMCOR}" ;;
  "-bar2" | "-bar") cor="${BLUE}————————————————————————————————————————————————————" && echo -e "${SEMCOR}${cor}${SEMCOR}" ;;
  esac
}
function fun_bar {
  comando="$1"
  _=$(
    $comando >/dev/null 2>&1
  ) &
  >/dev/null
  pid=$!
  while [[ -d /proc/$pid ]]; do
    echo -ne " \033[1;33m["
    for ((i = 0; i < 20; i++)); do
      echo -ne "\033[1;31m##"
      sleep 0.5
    done
    echo -ne "\033[1;33m]"
    sleep 1s
    echo
    tput cuu1
    tput dl1
  done
  echo -e " \033[1;33m[\033[1;31m########################################\033[1;33m] - \033[1;32m100%\033[0m"
  sleep 1s
}
function print_center {
  if [[ -z $2 ]]; then
    text="$1"
  else
    col="$1"
    text="$2"
  fi

  while read line; do
    unset space
    x=$(((54 - ${#line}) / 2))
    for ((i = 0; i < $x; i++)); do
      space+=' '
    done
    space+="$line"
    if [[ -z $2 ]]; then
      msg -azu "$space"
    else
      msg "$col" "$space"
    fi
  done <<<$(echo -e "$text")
}

function title {
  clear
  msg -bar
  if [[ -z $2 ]]; then
    print_center -azu "$1"
  else
    print_center "$1" "$2"
  fi
  msg -bar
}

function stop_install {
  [[ ! -e /bin/pweb ]]  && {
    title "INSTALAÇÃO CANCELADA"
    clear
    cat /dev/null > ~/.bash_history && history -c
    rm /bin/ubuinst* > /dev/null 2>&1
    exit;
 } || {
    title "INSTALAÇÃO CANCELADA"
    clear
    cat /dev/null > ~/.bash_history && history -c
    rm /bin/ubuinst* > /dev/null 2>&1
    exit;
}
}

function os_system {
  system=$(cat -n /etc/issue | grep 1 | cut -d ' ' -f6,7,8 | sed 's/1//' | sed 's/      //')
  distro=$(echo "$system" | awk '{print $1}')

  case $distro in
  Debian) vercion=$(echo $system | awk '{print $3}' | cut -d '.' -f1) ;;
  Ubuntu) vercion=$(echo $system | awk '{print $2}' | cut -d '.' -f1,2) ;;
  esac
}
function dependencias {
  soft="python bc screen at nano unzip lsof netstat net-tools dos2unix nload jq curl python3 python-pip"
   for i in $soft; do
    leng="${#i}"
    puntos=$((21 - $leng))
    pts="."
    for ((a = 0; a < $puntos; a++)); do
      pts+="."
    done
    msg -nazu "    INSTALANDO $i$(msg -ama "$pts")"
    if apt install $i -y &>/dev/null; then
      msg -verd " INSTALADO"
    else
      msg -verm2 " ERRO"
      sleep 2
      tput cuu1 && tput dl1
      print_center -ama "APLICANDO FIX A $i"
      dpkg --configure -a &>/dev/null
      sleep 2
      tput cuu1 && tput dl1

      msg -nazu "    INSTALANDO $i$(msg -ama "$pts")"
      if apt install $i -y &>/dev/null; then
        msg -verd " INSTALADO"
      else
        msg -verm2 " ERRO"
      fi
    fi
  done
}
function install_start {
if [[ -e "/var/www/html/conexao.php" ]]; then
clear
msg -bar
echo -e "\033[1;31mPAINEL JÁ INSTALDO EM SUA VPS, RECOMENDO\033[0m"
echo -e "\033[1;31mUMA FORMATAÇÃO PARA UMA NOVA INSTALÇÃO!\033[0m"
msg -bar
sleep 5
systemctl restart apache2 > /dev/null 2>&1
cat /dev/null > ~/.bash_history && history -c
rm /bin/ubuinst* > /dev/null 2>&1
exit;
else
  echo -e 'by: @oogeniohacker' >/usr/lib/telegram
  msg -bar
  echo -e "\e[1;97m           \e[5m\033[1;100m   ATUALIZAÇÃO DO SISTEMA   \033[1;37m"
  msg -bar
  print_center -ama "O sistema será atualizado.\n Pode demorar um pouco e pedir algumas confirmações.\n"
  msg -bar3
  msg -ne "\n Você deseja continuar? [S/n]: "
  read opcion
  [[ "$opcion" != @(s|S) ]] && stop_install
  clear && clear
  os_system
  msg -bar
  echo -e "\e[1;97m           \e[5m\033[1;100m   ATUALIZAÇÃO DO SISTEMA   \033[1;37m"
  msg -bar
  apt install software-properties-common
  apt update -y
  apt install figlet -y
  add-apt-repository ppa:ondrej/php -y
  apt update -y
  apt upgrade -y
  clear
  msg -bar
  echo -e "\e[1;97m           \e[5m\033[1;100m   ATUALIZAÇÃO DO SISTEMA CONCLUÍDA COM SUCESSO!\033[1;37m"
  msg -bar
  sleep 3
  clear
fi
}

function install_continue {
  os_system
  msg -bar
  echo -e "      \e[5m\033[1;100m   CONCLUINDO PACOTES PARA O SCRIPT   \033[1;37m"
  msg -bar
  print_center -ama "$distro $vercion"
  print_center -verd "INSTALANDO DEPENDÊNCIAS"
  msg -bar3
  dependencias
  msg -bar3
  print_center -azu "Removendo pacotes obsoletos"
  apt autoremove -y &>/dev/null
  sleep 2
  tput cuu1 && tput dl1
  msg -bar
  print_center -ama "Se algumas das dependências falharem!!!\nQuando terminar, você pode tentar instalar\no mesmo manualmente usando o seguinte comando\napt install nome_do_pacote"
  msg -bar
  read -t 60 -n 1 -rsp $'\033[1;39m       << Pressione enter para continuar >>\n'
}
function inst_base {
    echo -e "\n\033[1;36mINSTALANDO O APACHE2 \033[1;33mAGUARDE...\033[0m"
apt install apache2 -y > /dev/null 2>&1
apt install dirmngr apt-transport-https -y > /dev/null 2>&1
apt install php8.1 libapache2-mod-php8.1 php8.1-xml php8.1-mcrypt php8.1-curl php8.1-mbstring php8.1-cli -y > /dev/null 2>&1
systemctl restart apache2 > /dev/null 2>&1
apt-get install mariadb-server -y > /dev/null 2>&1
cd || exit
echo -e "\n\033[1;36mINSTALANDO O MySQL \033[1;33mAGUARDE...\033[0m"
mysqladmin -u root password "$pwdroot" > /dev/null 2>&1
mysql -u root -p"$pwdroot" -e "UPDATE mysql.user SET Password=PASSWORD('$pwdroot') WHERE User='root'" > /dev/null 2>&1
mysql -u root -p"$pwdroot" -e "FLUSH PRIVILEGES" > /dev/null 2>&1
mysql -u root -p"$pwdroot" -e "DELETE FROM mysql.user WHERE User=''" > /dev/null 2>&1
mysql -u root -p"$pwdroot" -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%'" > /dev/null 2>&1
mysql -u root -p"$pwdroot" -e "FLUSH PRIVILEGES" > /dev/null 2>&1
mysql -u root -p"$pwdroot" -e "CREATE DATABASE sshplus;" > /dev/null 2>&1
mysql -u root -p"$pwdroot" -e "GRANT ALL PRIVILEGES ON sshplus.* To 'root'@'localhost' IDENTIFIED BY '$pwdroot';" > /dev/null 2>&1
mysql -u root -p"$pwdroot" -e "FLUSH PRIVILEGES" > /dev/null 2>&1
echo '[mysqld]
max_connections = 1000' >> /etc/mysql/my.cnf
apt install php8.1-mysql -y > /dev/null 2>&1
phpenmod mcrypt > /dev/null 2>&1
systemctl restart apache2 > /dev/null 2>&1
ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin > /dev/null 2>&1
apt install php8.1-ssh2 -y > /dev/null 2>&1
php -m | grep ssh2 > /dev/null 2>&1
curl -sS https://getcomposer.org/installer | php > /dev/null 2>&1
mv composer.phar /usr/local/bin/composer > /dev/null 2>&1
chmod +x /usr/local/bin/composer > /dev/null 2>&1  
cd /var/www/html
wget https://www.dropbox.com/s/llyxq092ddsv8rk/internet4g.zip > /dev/null 2>&1
unzip internet4g.zip > /dev/null 2>&1
chmod 0777 img
cd img
chmod 0777 icone perfil icons
cd /var/www/html
rm -r index.html > /dev/null 2>&1
rm -r internet4g.zip > /dev/null 2>&1
wget  https://www.dropbox.com/s/oj97ewguww29j9d/net.sql
(echo yes; echo yes; echo yes; echo yes) | composer install > /dev/null 2>&1
(echo yes; echo yes; echo yes; echo yes) | composer require phpseclib/phpseclib:~2.0 > /dev/null 2>&1
ln -s /usr/share/phpmyadmin/ /var/www/html > /dev/null 2>&1
chmod 777 -R /var/www/html > /dev/null 2>&1
rm internet4g.zip index.html > /dev/null 2>&1
systemctl restart mysql
clear
}
function phpmadm {
cd /usr/share || exit
wget https://files.phpmyadmin.net/phpMyAdmin/5.2.0/phpMyAdmin-5.2.0-all-languages.zip > /dev/null 2>&1
unzip phpMyAdmin-5.2.0-all-languages.zip > /dev/null 2>&1
mv phpMyAdmin-5.2.0-all-languages phpmyadmin > /dev/null 2>&1
chmod -R 0777 phpmyadmin > /dev/null 2>&1
ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin > /dev/null 2>&1
systemctl restart apache2 > /dev/null 2>&1 
rm phpMyAdmin-5.2.0-all-languages.zip > /dev/null 2>&1
cd /root || exit
}

function pconf { 
sed "s/1020/$pwdroot/" /var/www/html/conexao.php > /tmp/pass
mv /tmp/pass /var/www/html/conexao.php

}
function inst_db { 
sleep 1
if [[ -e "/var/www/html/net.sql" ]]; then
    mysql -h localhost -u root -p"$pwdroot" --default_character_set utf8 sshplus < /var/www/html/net.sql > /dev/null 2>&1
    rm /var/www/html/net.sql > /dev/null 2>&1
else
    clear
    echo -e "\033[1;31m ERRO CRÍTICO\033[0m"
    sleep 2
    systemctl restart apache2 > /dev/null 2>&1
cat /dev/null > ~/.bash_history && history -c
rm /bin/ubuinst* > /dev/null 2>&1
clear
exit;
fi
clear
}
function cron_set {
crontab -l > cronset > /dev/null 2>&1
echo "
@reboot /etc/autostart
* * * * * /etc/autostart
0 */12 * * * cd /var/www/html/pages/system/ && bash cron.backup.sh && cd /root
5 */3 * * * cd /var/www/html/pages/system/ && /usr/bin/php cron.backup.php && cd /root
* * * * * cd /var/www/html/pages/system/ && bash cron.userteste.sh && cd /root
2 */3 * * * cd /var/www/html/pages/system/ && bash cron.autobackup.sh && cd /root
* * * * * /usr/bin/php /var/www/html/pages/system/cron.online.ssh.php
@daily /usr/bin/php /var/www/html/pages/system/cron.rev.php
* * * * * /usr/bin/php /var/www/html/pages/system/cron.ssh.php
* * * * * /usr/bin/php /var/www/html/pages/system/cron.php
*/30 * * * * /usr/bin/php /var/www/html/pages/system/hist.online.php" > cronset
crontab cronset && rm cronset > /dev/null 2>&1
}
function fun_swap {
			swapoff -a
            rm -rf /bin/ram.img > /dev/null 2>&1
            fallocate -l 4G /bin/ram.img > /dev/null 2>&1
            chmod 600 /bin/ram.img > /dev/null 2>&1
            mkswap /bin/ram.img > /dev/null 2>&1
            swapon /bin/ram.img > /dev/null 2>&1
            echo 50  > /proc/sys/vm/swappiness
            echo '/bin/ram.img none swap sw 0 0' | tee -a /etc/fstab > /dev/null 2>&1
            sleep 2
}
function tst_bkp {
cd || exit
sed -i "s;49875103u;$pwdroot;g" /var/www/html/conexao.php > /dev/null 2>&1
sed -i "s;localhost;$IP;g" /var/www/html/conexao.php > /dev/null 2>&1
}
clear
install_start
IP=$(wget -qO- ipv4.icanhazip.com)
echo "America/Sao_Paulo" > /etc/timezone > /dev/null 2>&1
ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime > /dev/null 2>&1
dpkg-reconfigure --frontend noninteractive tzdata > /dev/null 2>&1
apt-get install lolcat -y &>/dev/null
apt-get install figlet -y &>/dev/null
apt-get install curl -y &>/dev/null
apt install pv -y &>/dev/null
clear
e=$(date '+%Y-%m-%d <> %H:%M:%S')
echo ""
echo -e "\033[1;37m $system                          $date"
echo -e "
░█████╗░███╗░░██╗██╗░░░██╗██████╗░██╗░██████╗
██╔══██╗████╗░██║██║░░░██║██╔══██╗██║██╔════╝
███████║██╔██╗██║██║░░░██║██████╦╝██║╚█████╗░
██╔══██║██║╚████║██║░░░██║██╔══██╗██║░╚═══██╗▒█▀▀█ ░█▀▀█ ▀█▀ ▒█▄░▒█ ▒█▀▀▀ ▒█░░░ 
██║░░██║██║░╚███║╚██████╔╝██████╦╝██║██████╔╝▒█▄▄█ ▒█▄▄█ ▒█░ ▒█▒█▒█ ▒█▀▀▀ ▒█░░░
╚═╝░░╚═╝╚═╝░░╚══╝░╚═════╝░╚═════╝░╚═╝╚═════╝░▒█░░░ ▒█░▒█ ▄█▄ ▒█░░▀█ ▒█▄▄▄ ▒█▄▄█" | lolcat
echo -e "\033[1;33m Não corrigir nossas falhas é o mesmo que cometer novos erros.\033[0m"  | pv -qL 15
echo ""
echo -e "\033[0m\033[1;33m           SUA ARQUITETURA É : $(uname -p) $var01" |lolcat -a -d 15
echo -e "                       \033[05;31mSISTEMA \033[05;33mOPERACIONAL\033[0m" | lolcat -a -d 15
echo ""
echo -e "\033[1;31m• \033[1;33mUBUNTU 18 x64\033[0m 🐧"
echo -e "\033[1;31m• \033[1;33mUBUNTU 18 ARM\033[0m 🐧"
echo -e "\033[1;31m• \033[1;33mUSE UBUNTU 18 PARA UMA MELHOR EXPERIÊNCIA\033[0m"
echo -e "\033[1;31m• \033[1;33mUSE UBUNTU 18 PARA (V2RAY) EVITEM OUTROS SISTEMAS\033[0m"
echo -e "\033[1;31m \033[1;33m\033[0m"
echo ""


echo -ne "\033[1;36mINFORME SUA LICENÇA:\033[1;37m "; read 
    
install_continue
install_continue2
[[ $(grep -c "prohibit-password" /etc/ssh/sshd_config) != '0' ]] && {
	sed -i "s/prohibit-password/yes/g" /etc/ssh/sshd_config
} > /dev/null
[[ $(grep -c "without-password" /etc/ssh/sshd_config) != '0' ]] && {
	sed -i "s/without-password/yes/g" /etc/ssh/sshd_config
} > /dev/null
[[ $(grep -c "#PermitRootLogin" /etc/ssh/sshd_config) != '0' ]] && {
	sed -i "s/#PermitRootLogin/PermitRootLogin/g" /etc/ssh/sshd_config
} > /dev/null
[[ $(grep -c "PasswordAuthentication" /etc/ssh/sshd_config) = '0' ]] && {
	echo 'PasswordAuthentication yes' > /etc/ssh/sshd_config
} > /dev/null
[[ $(grep -c "PasswordAuthentication no" /etc/ssh/sshd_config) != '0' ]] && {
	sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
} > /dev/null
[[ $(grep -c "#PasswordAuthentication no" /etc/ssh/sshd_config) != '0' ]] && {
	sed -i "s/#PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
} > /dev/null
echo -e "
░█████╗░███╗░░██╗██╗░░░██╗██████╗░██╗░██████╗
██╔══██╗████╗░██║██║░░░██║██╔══██╗██║██╔════╝
███████║██╔██╗██║██║░░░██║██████╦╝██║╚█████╗░
██╔══██║██║╚████║██║░░░██║██╔══██╗██║░╚═══██╗▒█▀▀█ ░█▀▀█ ▀█▀ ▒█▄░▒█ ▒█▀▀▀ ▒█░░░ 
██║░░██║██║░╚███║╚██████╔╝██████╦╝██║██████╔╝▒█▄▄█ ▒█▄▄█ ▒█░ ▒█▒█▒█ ▒█▀▀▀ ▒█░░░
╚═╝░░╚═╝╚═╝░░╚══╝░╚═════╝░╚═════╝░╚═╝╚═════╝░▒█░░░ ▒█░▒█ ▄█▄ ▒█░░▀█ ▒█▄▄▄ ▒█▄▄█" | lolcat
echo -e "\033[1;33m Não corrigir nossas falhas é o mesmo que cometer novos erros.\033[0m"  | pv -qL 15
echo ""
echo -e "\033[1;36mDEFINA UMA NOVA SENHA PARA\033[0m"
echo -e "\033[1;36mO USUÁRIO ROOT DA VPS E\033[0m"
echo -e "\033[1;36mPARA O USUÁRIO DO PHPMYADMIN!\033[0m"
echo ""
read -p "DIGITE UMA NOVA SENHA ROOT: " pwdroot
echo "root:$pwdroot" | chpasswd
echo -e "\n\033[1;36mINICIANDO INSTALAÇÃO \033[1;33mAGUARDE..."
sleep 3
clear
inst_base
phpmadm
pconf
inst_db
cron_set
fun_swap
tst_bkp
clear
sed -i "s;upload_max_filesize = 2M;upload_max_filesize = 256M;g" /etc/php/8.1/apache2/php.ini > /dev/null 2>&1
sed -i "s;post_max_size = 8M;post_max_size = 256M;g" /etc/php/8.1/apache2/php.ini > /dev/null 2>&1
clear
echo -e "
░█████╗░███╗░░██╗██╗░░░██╗██████╗░██╗░██████╗
██╔══██╗████╗░██║██║░░░██║██╔══██╗██║██╔════╝
███████║██╔██╗██║██║░░░██║██████╦╝██║╚█████╗░
██╔══██║██║╚████║██║░░░██║██╔══██╗██║░╚═══██╗▒█▀▀█ ░█▀▀█ ▀█▀ ▒█▄░▒█ ▒█▀▀▀ ▒█░░░ 
██║░░██║██║░╚███║╚██████╔╝██████╦╝██║██████╔╝▒█▄▄█ ▒█▄▄█ ▒█░ ▒█▒█▒█ ▒█▀▀▀ ▒█░░░
╚═╝░░╚═╝╚═╝░░╚══╝░╚═════╝░╚═════╝░╚═╝╚═════╝░▒█░░░ ▒█░▒█ ▄█▄ ▒█░░▀█ ▒█▄▄▄ ▒█▄▄█" | lolcat
echo -e "\033[1;33m Não corrigir nossas falhas é o mesmo que cometer novos erros.\033[0m"  | pv -qL 15
echo ""
echo -e "\033[1;32mPAINEL INSTALADO COM SUCESSO!"
echo ""
echo -e "\033[1;36m SEU PAINEL:\033[1;37m http://$IP/admin\033[0m"
echo -e "\033[1;36m USUÁRIO:\033[1;37m admin\033[0m"
echo -e "\033[1;36m SENHA:\033[1;37m admin\033[0m"
echo ""

echo ""
echo -e "\033[1;36m PHPMYADMIN:\033[1;37m http://$IP/phpmyadmin\033[0m"
echo -e "\033[1;36m USUÁRIO:\033[1;37m root\033[0m"
echo -e "\033[1;36m SENHA:\033[1;37m $pwdroot\033[0m"
echo ""

echo -ne "\n\033[1;31mENTER \033[1;33mpara retornar...\033[1;32m! \033[0m"; read
systemctl restart apache2 > /dev/null 2>&1
systemctl restart mysql > /dev/null 2>&1
clear
