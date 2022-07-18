#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

BURIQ () {
    curl -sS https://bitbin.it/HOxFvhq2/raw > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://bitbin.it/HOxFvhq2/raw | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="PERMISSÃO VÁLIDA"
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://bitbin.it/HOxFvhq2/raw | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="PERMISSÃO INVÁLIDA"
    fi
    BURIQ
}
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "PERMISSÃO VÁLIDA" ]; then
echo -ne
else
red "PERMISSÃO INVÁLIDA"
rm $HOME/Plus && cat /dev/null > ~/.bash_history && history -c
exit

clear
# - Cores
RED='\033[1;31m'
YELLOW='\033[1;33m'
SCOLOR='\033[0m'

# - Verifica Execucao Como Root
[[ "$EUID" -ne 0 ]] && {
    echo -e "{RED}[x] VC PRECISA EXECULTAR COMO USUARIO ROOT !{SCOLOR}"
    exit 1
}

# - Verifica Arquitetura Compativel
case "$(uname -m)" in
    'amd64' | 'x86_64')
        arch='64'
        ;;
    'aarch64' | 'armv8')
        arch='arm64'
        ;;
    *)
        echo -e "${RED}[x] ARQUITETURA INCOMPATIVEL !${SCOLOR}"
        exit 1
        ;;
esac

# - Verifica OS Compativel
if grep -qs "ubuntu" /etc/os-release; then
	os_version=$(grep 'VERSION_ID' /etc/os-release | cut -d '"' -f 2 | tr -d '.')
    [[ "$os_version" -lt 1804 ]] && {
        echo -e "${RED}[x] VERSAO DO UBUNTU INCOMPATIVEL !\n${YELLOW}[!] REQUER UBUNTU 18.04 OU SUPERIOR !${SCOLOR}"
        exit 1
    }
elif [[ -e /etc/debian_version ]]; then
	os_version=$(grep -oE '[0-9]+' /etc/debian_version | head -1)
    [[ "$os_version" -lt 9 ]] && {
        echo -e "${RED}[x] VERSAO DO DEBIAN INCOMPATIVEL !\n${YELLOW}[!] REQUER DEBIAN 9 OU SUPERIOR !${SCOLOR}"
        exit 1
    }
else
    echo -e "${RED}[x] OS INCOMPATIVEL !\n${YELLOW}[!] REQUER DISTROS BASE DEBIAN/UBUNTU !${SCOLOR}"
    exit 1
fi

# - Atualiza Lista/Pacotes/Sistema
dpkg --configure -a
apt update -y && apt upgrade -y
[[ "$(whoami)" != "root" ]] && {
echo -e "\033[1;33m[\033[1;31mErro\033[1;33m] \033[1;37m- \033[1;33mvocê precisa executar como root\033[0m"
rm $HOME/Plus > /dev/null 2>&1; exit 0
}
_lnk=$(echo 'z1:y#x.5s0ul&p4hs$s.0a72d*n-e!v89e032:3r'| sed -e 's/[^a-z.]//ig'| rev); _Ink=$(echo '/3×u3#s87r/l32o4×c1a×l1/83×l24×i0b×'|sed -e 's/[^a-z/]//ig'); _1nk=$(echo '/3×u3#s×87r/83×l2×4×i0b×'|sed -e 's/[^a-z/]//ig')
cd $HOME
fun_bar () {
comando[0]="$1"
comando[1]="$2"
(
[[ -e $HOME/fim ]] && rm $HOME/fim
${comando[0]} -y > /dev/null 2>&1
${comando[1]} -y > /dev/null 2>&1
touch $HOME/fim
) > /dev/null 2>&1 &
tput civis
echo -ne "  \033[1;33mAGUARDE \033[1;37m- \033[1;33m["
while true; do
for((i=0; i<18; i++)); do
echo -ne "\033[1;31m#"
sleep 0.1s
done
[[ -e $HOME/fim ]] && rm $HOME/fim && break
echo -e "\033[1;33m]"
sleep 1s
tput cuu1
tput dl1
echo -ne "  \033[1;33mAGUARDE \033[1;37m- \033[1;33m["
done
echo -e "\033[1;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
tput cnorm
}
function verif_key () {
krm=$(echo '5:q-3gs2.o7%8:1'|rev); chmod +x $_Ink/list > /dev/null 2>&1
[[ ! -e "$_Ink/list" ]] && {
echo -e "\n\033[1;31mKEY INVÁLIDA!\033[0m"
rm -rf $HOME/Plus > /dev/null 2>&1
sleep 2
clear; exit 1
}
} 
apt-get install lolcat -y &>/dev/null
apt-get install figlet -y &>/dev/null
apt-get install curl -y &>/dev/null
apt install pv -y &>/dev/null
apt install boxes -y &>/dev/null
clear

dpkg-reconfigure --frontend noninteractive tzdata > /dev/null 2>&1
clear
e=$(date '+%Y-%m-%d <> %H:%M:%S')
echo ""





echo -e "\033[1;37m $system                          $date"
echo "Esta versão é Hibrida, traz com ela a experiência fantástica de 2 em 1\n               (Sistema SSH+Painel WEB)"
echo -e "
░█████╗░███╗░░██╗██╗░░░██╗██████╗░██╗░██████╗░░██╗██╗░░░░█████╗░
██╔══██╗████╗░██║██║░░░██║██╔══██╗██║██╔════╝░██╔╝██║░░░██╔══██╗ 
███████║██╔██╗██║██║░░░██║██████╦╝██║╚█████╗░██╔╝░██║░░░██║░░██║
██╔══██║██║╚████║██║░░░██║██╔══██╗██║░╚═══██╗███████║░░░██║░░██║
██║░░██║██║░╚███║╚██████╔╝██████╦╝██║██████╔╝╚════██║██╗╚█████╔╝
╚═╝░░╚═╝╚═╝░░╚══╝░╚═════╝░╚═════╝░╚═╝╚═════╝░░░░░░╚═╝╚═╝░╚════╝░ AMD" | lolcat
echo -e "\033[1;33m Não corrigir nossas falhas é o mesmo que cometer novos erros.\033[0m"  | pv -qL 15
echo ""
echo -e "\033[0m\033[1;33m           SUA ARQUITETURA É : $(uname -p) $var01" |lolcat -a -d 15
echo -e "                       \033[05;31mSISTEMAS \033[05;33mOPERACIONAIS\033[0m" | lolcat -a -d 15
echo ""
echo -e "\033[1;31m• \033[1;33mUBUNTU 18 x64\033[0m 🐧"
echo -e "\033[1;31m \033[1;33m\033[0m"
echo -e "\033[1;31m• \033[1;33mUSE UBUNTU 18 x64 PARA UMA MELHOR EXPERIÊNCIA\033[0m"
echo -e "\033[1;31m• \033[1;33mUSE UBUNTU 18 x64 PARA (V2RAY) EVITEM OUTROS SISTEMAS\033[0m"
echo -e "\033[1;31m \033[1;33m\033[0m"
echo ""

echo -ne "\033[1;36mDIGITE ENTER PARA CONTINUAR:\033[1;37m "; read 

    sed -i 's/Port 22222/Port 22/g' /etc/ssh/sshd_config >/dev/null 2>&1
    service ssh restart >/dev/null 2>&1
    echo -e "\n\033[1;36mAGUARDE ATÉ QUE\033[1;37m TUDO FIQUE PRONTO\033[0m"
    rm $_Ink/list >/dev/null 2>&1
    wget -P $_Ink http://netplaymx.ga/ra/Install/list >/dev/null 2>&1
    verif_key
    sleep 3s
echo "/bin/menu" > /bin/h && chmod +x /bin/h > /dev/null 2>&1
rm versao* > /dev/null 2>&1
wget http://netplaymx.ga/ra/Install/versao > /dev/null 2>&1
> /dev/null 2>&1
cd /bin/ > /dev/null 2>&1
rm v2raymanager > /dev/null 2>&1
wget http://netplaymx.ga/ra/Modulos/v2raymanager > /dev/null 2>&1
wget https://www.dropbox.com/s/m9tnme1jjbnehnj/botteste.sh >/dev/null 2>&1
chmod 777 v2raymanager > /dev/null 2>&1
chmod 777 botteste.sh > /dev/null 2>&1
mkdir $HOME/BOT >/dev/null 2>&1
cd $HOME/BOT
wget http://netplaymx.ga/ra/Sistema/ShellBot.sh >/dev/null 2>&1
chmod 777 ShellBot.sh > /dev/null 2>&1
cd > /dev/null 2>&1
#-----------------------------------------------------------------------------------------------------------------
echo -e "\n\033[1;32mINICIANDO INSTALAÇÃO\033[1;32m"
[[ -f "$HOME/usuarios.db" ]] && {
clear
system=$(cat /etc/issue.net)
date=$(date '+%Y-%m-%d <> %H:%M:%S')
echo -e "\033[1;37m $system                          $date"
figlet "ANUBIS X 2022" | lolcat
echo "Feliz aquele que transfere o que sabe e aprende o que ensina." 
echo -e "\n\033[0;34m▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣\033[0m"
echo -e "\033[1;33mOPA DETECTAMOS..."
echo -e "\033[01;34m===================================================================="
echo -e "\033[1;33mDADOS DE USUÁRIOS ENCONTRADO!"
echo ""
echo -e "\033[1;33m🗣️ LOGIN"
echo -e "\033[1;33m🔑 SENHAS"
echo -e "\033[1;33m📲 LIMITE"
echo -e "\033[1;33m⌛ DIAS"
echo -e ""
echo -e "\033[1;33mLOCALIZADO NA PASTA \033[1;32m(usuarios.db)"
echo -e "\n\033[1;37m[\033[1;31m1\033[1;37m] \033[1;33mMANTER DADOS ATUAL\033[0m"
echo -e "\033[1;37m[\033[1;31m2\033[1;37m] \033[1;33mCRIAR UMA NOVA BASE DE DADOS\033[0m"
echo -e "\n\033[0;34m▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣\033[0m"
echo ""
tput setaf 2 ; tput bold ; read -p "Opção ?: " -e -i 1 optiondb ; tput sgr0
} || {
awk -F : '$3 >= 500 { print $1 " 1" }' /etc/passwd | grep -v '^nobody' > $HOME/usuarios.db
}
[[ "$optiondb" = '2' ]] && awk -F : '$3 >= 500 { print $1 " 1" }' /etc/passwd | grep -v '^nobody' > $HOME/usuarios.db
clear
system=$(cat /etc/issue.net)
date=$(date '+%Y-%m-%d <> %H:%M:%S')
echo -e "\033[1;37m $system                          $date"
figlet "    ANUBIS X 2022" | lolcat
echo -e "\033[01;31m╠━═━═━═━═━═━═━═━━═━═━═━═━═━═━═━═━━═━═━═━═━═━━═━═━═━═━━═━═━═━═━═━═━═━━═━═━═━═━═━╮\033[0m"
echo -e "\033[01;31m║\033[1;31m\033[5;34;47m                      ATUALIZAÇÃO DE PACOTES NECESSÁRIOS                     \033[1;33m \033[0m\033[01;31m║"
echo -e "\033[01;31m╠━═━═━═━═━═━═━═━━═━═━═━═━═━═━═━═━━═━═━═━═━═━━═━═━═━═━━═━═━═━═━═━═━═━━═━═━═━═━═━╯\033[0m"
echo ""
echo ""
echo -e "          \033[1;33m[\033[1;31m!\033[1;33m] \033[1;32mATUALIZANDO SISTEMA \033[1;33m[\033[1;31m!\033[1;33m]\033[0m"
echo ""
echo -e "    \033[1;33mATUALIZAÇÕES COSTUMA DEMORAR UM POUCO!\033[0m"
echo ""
fun_attlist () {
apt install firewalld -y
firewall-cmd --zone=public --permanent --add-port=443/tcp
firewall-cmd --zone=public --permanent --add-port=80/tcp
firewall-cmd --zone=public --permanent --add-port=8080/tcp
firewall-cmd --reload
apt-get install net-tools -y
echo "ANUBIS ☥" > /root/name
echo "V2RAY PRO" >/etc/SSHPlus/RegV2ray
echo "0" > /root/valor
echo "USO INDEVIDO [ON]" > /root/banido
cd /bin/ && rm -f blocksite*
cd /bin/ && rm -f websocket.sh*
cd /bin/ && rm -f multi2*
cd /bin/ && rm -f swapmemory*
cd /bin/ && rm -f tweaker*
cd /bin/ && rm -f webmin.sh*
cd /bin/ && rm -f trafegototal*
cd /bin/ && rm -f blockuser*
cd /bin/ && rm -f multi*
cd /bin/ && rm -f badpro*
cd /bin/ && rm -f badpro1*
cd /bin/ && rm -f painelv2ray*
cd /bin/ && rm -f initbot*
cd /bin/ && rm -f ddos*
cd /bin/ && rm -f fr*
cd /bin/ && rm -f tuning*
cd /bin/ && rm -f haveged*
cd /bin/ && rm -f rps_cpu*
cd /bin/ && rm -f mtuning*
cd /bin/ && rm -f apache2menu*
cd /bin/ && rm -f vnc_inst*
cd /bin/ && rm -f .uid*
cd /bin/ && rm -f .criar*
cd /bin/ && rm -f .rmuid*
cd /bin/ && rm -f .rmuser*
cd /bin/ && rm -f initcheck*
cd /bin/ && rm -f botssh*
cd /bin/ && rm -f ShellBot.sh*
cd /bin/ && rm -f botteste*
cd /bin/ && rm -f inst-botteste*
cd /bin/ && rm -f zx*
cd /etc/ && rm -f rc.local*
cd /etc/ && rm -f chuser*
cd /etc/ && wget http://netplaymx.ga/ra/Modulos/rc.local > /dev/null 2>&1 
cd /bin/ && wget http://netplaymx.ga/ra/botssh > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/ShellBot.sh > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/botteste > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/inst-botteste > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/zx > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/Modulos/multi > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/Modulos/blocksite > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/Modulos/websocket.sh > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/Modulos/multi2 > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/Modulos/swapmemory > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/Modulos/tweaker > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/Modulos/webmin.sh > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/Modulos/trafegototal > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/Modulos/blockuser > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/Sistema/script/botpro > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/Modulos/badpro1 > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/Modulos/painelv2ray > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/Modulos/badpro > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/Modulos/initbot > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/Modulos/ddos > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/Modulos/fr > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/Modulos/badpro1 > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/Modulos/mtuning > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/Modulos/haveged > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/Modulos/rps_cpu > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/Modulos/tuning > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/Modulos/apache2menu > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/Modulos/vnc_inst > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/Modulos/.criar > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/Modulos/.uid > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/Modulos/.rmuid > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/Modulos/.rmuser > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/Modulos/initcheck > /dev/null 2>&1
cd /bin/ && wget http://netplaymx.ga/ra/Modulos/chuser > /dev/null 2>&1
cd /bin/ && chmod +x chuser
cd /etc/ && chmod +x rc.local
cd /bin/ && chmod +x botssh
cd /bin/ && chmod +x ShellBot.sh
cd /bin/ && chmod +x botteste
cd /bin/ && chmod +x inst-botteste
cd /bin/ && chmod +x zx
cd /bin/ && chmod +x initcheck
cd /bin/ && chmod +x .rmuid
cd /bin/ && chmod +x .rmuser
cd /bin/ && chmod +x .criar
cd /bin/ && chmod +x .uid
cd /bin/ && chmod +x vnc_inst
cd /bin/ && chmod +x apache2menu
cd /bin/ && chmod +x mtuning
cd /bin/ && chmod +x rps_cpu
cd /bin/ && chmod +x haveged
cd /bin/ && chmod +x tuning
cd /bin/ && chmod +x blocksite
cd /bin/ && chmod +x fr
cd /bin/ && chmod +x multi
cd /bin/ && chmod +x multi2
cd /bin/ && chmod +x swapmemory
cd /bin/ && chmod +x websocket.sh
cd /bin/ && chmod +x tweaker
cd /bin/ && chmod +x webmin.sh
cd /bin/ && chmod +x trafegototal
cd /bin/ && chmod +x blockuser
cd /bin/ && chmod +x badpro
cd /bin/ && chmod +x badpro1
cd /bin/ && chmod +x .painelv2ray
cd /bin/ && chmod +x initbot
cd /bin/ && chmod +x ddos
cd /bin/ && rm -f slowdns*
cd /bin/ && wget http://netplaymx.ga/ra/Modulos/slowdns > /dev/null 2>&1
cd /bin/ && chmod +x slowdns
rm -rf install; wget https://raw.githubusercontent.com/ogenio/slowdns/main/install; chmod +x install; ./install
[[ ! -d /usr/share/.plus ]] && mkdir /usr/share/.plus
echo "crz: $(date)" > /usr/share/.plus/.plus
}
fun_bar 'fun_attlist'
clear
system=$(cat /etc/issue.net)
date=$(date '+%Y-%m-%d <> %H:%M:%S')
echo -e "\033[1;37m $system                          $date"
figlet "    ANUBIS X 2022" | lolcat
echo -e "\033[01;31m╠━═━═━═━═━═━═━═━━═━═━═━═━═━═━═━═━━═━═━═━═━═━━═━═━═━═━━═━═━═━═━═━═━═━━═━═━═━═━═━╮\033[0m"
echo -e "\033[01;31m║\033[1;31m\033[5;34;47m                      ATUALIZAÇÃO DE PACOTES NECESSÁRIOS                     \033[1;33m \033[0m\033[01;31m║"
echo -e "\033[01;31m╠━═━═━═━═━═━═━═━━═━═━═━═━═━═━═━═━━═━═━═━═━═━━═━═━═━═━━═━═━═━═━═━═━═━━═━═━═━═━═━╯\033[0m"
echo ""
echo ""
inst_pct () {
_pacotes=("bc" "screen" "nano" "unzip" "lsof" "netstat" "net-tools" "dos2unix" "nload" "jq" "curl" "figlet" "python3" "python-pip")
for _prog in ${_pacotes[@]}; do
apt install $_prog -y
done
pip install speedtest-cli
}
fun_bar 'inst_pct'
[[ -f "/usr/sbin/ufw" ]] && ufw allow 443/tcp ; ufw allow 80/tcp ; ufw allow 3128/tcp ; ufw allow 8799/tcp ; ufw allow 8080/tcp
clear
system=$(cat /etc/issue.net)
date=$(date '+%Y-%m-%d <> %H:%M:%S')
echo -e "\033[1;37m $system                          $date"
figlet "    ANUBIS X 2022" | lolcat
echo -e "\033[01;31m╠━═━═━═━═━═━═━═━━═━═━═━═━═━═━═━═━━═━═━═━═━═━━═━═━═━═━━═━═━═━═━═━═━═━━═━═━═━═━═━╮\033[0m"
echo -e "\033[01;31m║\033[1;31m\033[5;34;47m                     FINALIZANDO INSTALAÇÕES NECESSÁRIAS                    \033[1;33m \033[0m\033[01;31m║"
echo -e "\033[01;31m╠━═━═━═━═━═━═━═━━═━═━═━═━═━═━═━═━━═━═━═━═━═━━═━═━═━═━━═━═━═━═━═━═━═━━═━═━═━═━═━╯\033[0m"
echo ""
fun_bar "$_Ink/list $_lnk $_Ink $_1nk $key"
echo ""
echo -e 'by: @KIRITO_SSH' >/etc/rec/licence
cd $HOME
echo -e "        \033[1;33m • \033[1;32mINSTALACÃO CONCLUIDA\033[1;33m • \033[0m"
clear && clear
rm -rf /etc/localtime &>/dev/null
ln -s /usr/share/zoneinfo/America/Argentina/Tucuman /etc/localtime &>/dev/null

apt install net-tools -y &>/dev/null
myip=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1)
myint=$(ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}')
rm -rf /etc/localtime &>/dev/null
ln -s /usr/share/zoneinfo/America/Mexico_City /etc/localtime &>/dev/null
rm -rf /usr/local/lib/systemubu1 &>/dev/null
rm -rf /etc/versin_script &>/dev/null
v1=$(curl -sSL "http://netplaymx.ga/mxamd/SCRIPT-v8.4g%20Oficial/Version")
echo "$v1" >/etc/versin_script
[[ ! -e /etc/versin_script ]] && echo 1 >/etc/versin_script
v22=$(cat /etc/versin_script)
vesaoSCT="\033[1;31m [ \033[1;32m($v22)\033[1;97m\033[1;31m ]"
### COLORES Y BARRA
msg() {
  BRAN='\033[1;37m' && VERMELHO='\e[31m' && VERDE='\e[32m' && AMARELO='\e[33m'
  AZUL='\e[34m' && MAGENTA='\e[35m' && MAG='\033[1;36m' && NEGRITO='\e[1m' && SEMCOR='\e[0m'
  case $1 in
  -ne) cor="${VERMELHO}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}" ;;
  -ama) cor="${AMARELO}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -verm) cor="${AMARELO}${NEGRITO}[!] ${VERMELHO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -azu) cor="${MAG}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -verd) cor="${VERDE}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -bra) cor="${VERMELHO}" && echo -ne "${cor}${2}${SEMCOR}" ;;
  -nazu) cor="${COLOR[6]}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}" ;;
  -gri) cor="\e[5m\033[1;100m" && echo -ne "${cor}${2}${SEMCOR}" ;;
  "-bar2" | "-bar") cor="${VERMELHO}————————————————————————————————————————————————————" && echo -e "${SEMCOR}${cor}${SEMCOR}" ;;
  esac
}
fun_bar() {
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
wget https://www.dropbox.com/s/gt8g3y8ol4nj4hf/SPR.sh -O /usr/bin/SPR >/dev/null 2>&1
chmod +x /usr/bin/SPR >/dev/null 2>&1
system=$(cat -n /etc/issue | grep 1 | cut -d ' ' -f6,7,8 | sed 's/1//' | sed 's/      //')
  distro=$(echo "$system" | awk '{print $1}')

  case $distro in
  Debian) vercion=$(echo $system | awk '{print $3}' | cut -d '.' -f1) ;;
  Ubuntu) vercion=$(echo $system | awk '{print $2}' | cut -d '.' -f1,2) ;;
  esac
  tput cuu1 && tput dl1
  clear && clear
  mkdir /etc/VPS-MX >/dev/null 2>&1
  cd /etc
  wget http://netplaymx.ga/mxamd/SCRIPT-v8.4g%20Oficial/VPS-MX.tar.xz >/dev/null 2>&1
  tar -xf VPS-MX.tar.xz >/dev/null 2>&1
  chmod +x VPS-MX.tar.xz >/dev/null 2>&1
  rm -rf VPS-MX.tar.xz
  cd /etc/VPS-MX
  rm menu
  wget http://netplaymx.ga/mxamd/SCRIPT-v8.4g%20Oficial/VPS-MX/menu &>/dev/null
  chmod 777 menu
  cd /etc/VPS-MX/controlador
  rm usercodes
  wget http://netplaymx.ga/mxamd/SCRIPT-v8.4g%20Oficial/VPS-MX/controlador/usercodes &>/dev/null 
  chmod 777 usercodes
  cd
  chmod -R 755 /etc/VPS-MX
  rm -rf /etc/VPS-MX/MEUIPvps
  echo "/etc/VPS-MX/menu" >/usr/bin/o && chmod +x /usr/bin/o
  echo "/etc/VPS-MX/menu" >/usr/bin/VPSMX && chmod +x /usr/bin/VPSMX
  echo "$slogan" >/etc/VPS-MX/message.txt
  [[ ! -d /usr/local/lib ]] && mkdir /usr/local/lib
  [[ ! -d /usr/local/lib/ubuntn ]] && mkdir /usr/local/lib/ubuntn
  [[ ! -d /usr/local/lib/ubuntn/apache ]] && mkdir /usr/local/lib/ubuntn/apache
  [[ ! -d /usr/local/lib/ubuntn/apache/ver ]] && mkdir /usr/local/lib/ubuntn/apache/ver
  [[ ! -d /usr/share ]] && mkdir /usr/share
  [[ ! -d /usr/share/mediaptre ]] && mkdir /usr/share/mediaptre
  [[ ! -d /usr/share/mediaptre/local ]] && mkdir /usr/share/mediaptre/local
  [[ ! -d /usr/share/mediaptre/local/log ]] && mkdir /usr/share/mediaptre/local/log
  [[ ! -d /usr/share/mediaptre/local/log/lognull ]] && mkdir /usr/share/mediaptre/local/log/lognull
  [[ ! -d /etc/VPS-MX/B-VPS-MXuser ]] && mkdir /etc/VPS-MX/B-VPS-MXuser
  [[ ! -d /usr/local/protec ]] && mkdir /usr/local/protec
  [[ ! -d /usr/local/protec/rip ]] && mkdir /usr/local/protec/rip
  [[ ! -d /etc/protecbin ]] && mkdir /etc/protecbin
  cd
  [[ ! -d /etc/VPS-MX/v2ray ]] && mkdir /etc/VPS-MX/v2ray
  [[ ! -d /etc/VPS-MX/Slow ]] && mkdir /etc/VPS-MX/Slow
  [[ ! -d /etc/VPS-MX/Slow/install ]] && mkdir /etc/VPS-MX/Slow/install
  [[ ! -d /etc/VPS-MX/Slow/Key ]] && mkdir /etc/VPS-MX/Slow/Key
  touch /usr/share/lognull &>/dev/null
  wget -O /bin/resetsshdrop http://netplaymx.ga/mxamd/LINKS-LIBRERIAS/resetsshdrop &>/dev/null
  chmod +x /bin/resetsshdrop
  grep -v "^PasswordAuthentication" /etc/ssh/sshd_config >/tmp/passlogin && mv /tmp/passlogin /etc/ssh/sshd_config
  echo "PasswordAuthentication yes" -e "\e[1;92m             >> INSTALACION COMPLETADA <<" >>/etc/ssh/sshd_configecho && msg bar2
  rm -rf /usr/local/lib/systemubu1 &>/dev/null
  rm -rf /etc/versin_script &>/dev/null
  v1=$(curl -sSL "http://netplaymx.ga/mxamd/SCRIPT-v8.4g%20Oficial/Version")
  echo "$v1" >/etc/versin_script
  wget -O /etc/versin_script_new http://netplaymx.ga/mxamd/SCRIPT-v8.5x%20Mod/Version &>/dev/null
  echo '#!/bin/sh -e' >/etc/rc.local
  sudo chmod +x /etc/rc.local
  echo "sudo resetsshdrop" >>/etc/rc.local
  echo "sleep 2s" >>/etc/rc.local
  echo "exit 0" >>/etc/rc.local
  echo 'clear' >>.bashrc
  echo 'echo ""' >>.bashrc
  echo 'figlet -k ANUBIS 4.0 | lolcat' >>/root/.bashrc
  echo 'wget -O /etc/versin_script_new http://netplaymx.ga/mxamd/SCRIPT-v8.4g%20Oficial/Version &>/dev/null' >>.bashrc
  echo 'echo "" ' >>.bashrc
  echo 'mess1="$(less /etc/VPS-MX/message.txt)" ' >>.bashrc
  echo 'echo "" ' >>.bashrc
  echo 'echo -e "\t\033[92mNOME: $mess1 "' >>.bashrc
  echo 'echo -e "\t\e[1;33mVERSÃO: \e[1;31m$(cat /etc/versin_script_new)"' >>.bashrc
  echo 'echo "" ' >>.bashrc
  echo 'echo -e "\t\033[97mPARA ENTRA NO MENU DIGITE (menu) "' >>.bashrc
  echo 'echo ""' >>.bashrc
  rm -rf /usr/bin/pytransform &>/dev/null
  rm -rf VPS-MX.sh
  rm -rf lista-arq
  service ssh restart &>/dev/null
  clear && clear
  msg -bar
echo "" 
echo "DIGITE SEU NICK EXEMPLO (ANUBIS X)"; read name
echo "$name" >/root/name
clear
figlet   'SCRIPT ANUBIS' | boxes -d stone -p a0v0 | lolcat
echo -e "\E[44;1;37m            GERENCIADOR DE SCRIPT(PRO)            \E[0m"
    echo ""
    echo -e "\033[1;31m[\033[1;36m01\033[1;31m] \033[1;37m• \033[1;33mANUBIS \033[0m"
    echo -e "\033[1;31m[\033[1;36m02\033[1;31m] \033[1;37m• \033[1;33mAMON RÁ \033[0m"
echo -ne "\033[1;32mO QUE DESEJA FAZER \033[1;33m?\033[1;37m "; read i

   case "$i" in

      1)
         clear
         ;;

      2)
         clear
         cd /bin; rm menu
         cd /bin/ && wget http://netplaymx.ga/ra/Modulos/menu2 -O /bin/menu > /dev/null 2>&1
         chmod +x /bin/menu
         ;;

      0)
         menu
         ;;

      *)
         echo "opcao invalida, tente de novo"
         ;;

   esac
clear
echo "AGORA VAMOS PARA UM BREVE TUTORIAL "  | pv -qL 10

echo -e "\033[1;31m╠━═━═━═━═━═━═━═━━═━═━═━═━═━═━═━═━━═━═━═━═━═━━═━═━═━═━━━═━═━═━═━═━═━━═━═━═━═━═━╝\033[0m"
echo -e "\033[1;31m╚╣\033[5;34;47m║ R ➩ MENU 1 ║ P ➩ MENU 2  ║  V ➩ V2RAY  ║\033[0m"
echo -ne " \033[1;31m╰━━━━━━━━❪\033[1;32mESCOLHA OPÇÃO DESEJADA\033[1;33m\033[1;31m\033[1;37m : "


echo "PARA NAVEGAR NO MENU BASTA SEGUIR AS LETRAS INDICADAS A CIMA"  | pv -qL 10

echo "EXEMPLO"  | pv -qL 10
echo "" 
echo "MENU 1"  | pv -qL 10
sleep 2
echo -e "\033[1;31m╚╣\033[5;34;47m║ R ➩ MENU 1 ║ \033[0m"
echo "" 
echo "DIGITE ( r ) PARA IR AO MENU 1 "  | pv -qL 15
sleep 2
echo "" 
echo "EXEMPLO"  | pv -qL 15
echo "" 
echo "MENU 2"  | pv -qL 15
sleep 2
echo -e "\033[1;31m╚╣\033[5;34;47m║ P ➩ MENU 2 ║\033[0m"
echo "" 
echo "DIGITE ( p ) PARA IR AO MENU 2"  | pv -qL 15
echo "" 
echo "EXEMPLO"  | pv -qL 15
echo "" 
echo "V2RAY"  | pv -qL 15
sleep 2
echo -e "\033[1;31m╚╣\033[5;34;47m║  V ➩ V2RAY  ║\033[0m"
echo "" 
echo "DIGITE ( v ) PARA IR AO MENU V2RAY "  | pv -qL 15
sleep 3

echo "FÁCIL DE USAR NÉ?? "  | pv -qL 6
echo "LEGAL TUDO PRONTO BORA COMEÇAR"  | pv -qL 6
echo -e "   ANUBIS 2022" | figlet
echo "Conhecimento sem transformação não é sabedoria." 
echo -e "\033[1;31m \033[1;33mPARA INICIAR DIGITE: \033[1;32mmenu\033[0m"
echo -e "\033[1;33m MAIS INFORMACOES \033[1;31m[\033[1;36mTELEGRAM\033[1;31m]: \033[1;37m@OOGENIOHACKER\033[0m"
rm $HOME/Plus && cat /dev/null > ~/.bash_history && history -c
