yum -y install epel-release
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.rpm.sh | bash
yum -y upgrade
yum -y install  ansible atop bind-utils bmon bridge-utils collectl cpulimit crash crontabs curl dos2unix git git-lfs groovy htop iftop iotop iptables iptraf-ng lshw lsof maven mc mlocate nc net-tools ngrep nload nmap nmon nodejs perl powertop psacct python3 python3-pip ruby saidar strace sysstat telnet tmux traceroute tree unzip vim wget which zip
yum -y upgrade
updatedb
