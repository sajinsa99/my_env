FROM centos:centos7.7.1908



RUN rm -f /etc/localtime ; ln -s /usr/share/zoneinfo/CET /etc/localtime
#RUN yum -y install glibc-langpack-en
RUN yum -y install epel-release
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.rpm.sh | bash
RUN yum -y upgrade

RUN yum -y install ansible
RUN yum -y install atop
RUN yum -y install bind-utils
RUN yum -y install bmon
RUN yum -y install bridge-utils
RUN yum -y install collectl
RUN yum -y install cpulimit
RUN yum -y install crash
RUN yum -y install crontabs
RUN yum -y install curl
RUN yum -y install dos2unix
RUN yum -y install git
RUN yum -y install git-lfs
RUN yum -y install groovy
RUN yum -y install htop
RUN yum -y install iftop
RUN yum -y install iotop
RUN yum -y install iptables
RUN yum -y install iptraf-ng
RUN yum -y install lshw
RUN yum -y install lsof
RUN yum -y install maven
RUN yum -y install mc
RUN yum -y install mlocate
RUN yum -y install nc
RUN yum -y install net-tools
RUN yum -y install ngrep
RUN yum -y install nload
RUN yum -y install nmap
RUN yum -y install nmon
RUN yum -y install nodejs
RUN yum -y install perl
RUN yum -y install powertop
RUN yum -y install psacct
RUN yum -y install python3
RUN yum -y install python3-pip
RUN yum -y install ruby
RUN yum -y install saidar
RUN yum -y install strace
RUN yum -y install sysstat
RUN yum -y install telnet
RUN yum -y install tmux
RUN yum -y install traceroute
RUN yum -y install tree
RUN yum -y install unzip
RUN yum -y install vim
RUN yum -y install wget
RUN yum -y install which
RUN yum -y install zip

RUN yum -y upgrade
RUN updatedb

RUN pip3 install --upgrade pip
RUN pip3 install --upgrade pip;pip3 list --outdated --format=freeze | grep -v ^-e | cut -d = -f 1  | xargs -n1 pip3 install -U
RUN gem install rubygems-update;update_rubygems;gem update --system;gem update
RUN curl https://omnitruck.chef.io/install.sh | bash -s -- -P chefdk -c stable -v 4.6.35

RUN cd /root/ ; git clone git://github.com/KittyKatt/screenFetch.git screenfetch ; cd screenfetch ; mv screenfetch-dev /usr/bin/screenfetch ; cd /root/ ; rm -rf screenfetch
ADD .alias /root/
ADD .vimrc /root/
ADD .tmux.conf /root/
ADD PS1.txt /root/
RUN chmod 500 /root/.alias
RUN chmod 500 /root/.vimrc
RUN chmod 500 /root/.tmux.conf
RUN echo ". .alias" >> /root/.bashrc
RUN cat /root/PS1.txt >> /root/.bashrc ; rm -f /root/PS1.txt
RUN echo "echo" >> /root/.bashrc
RUN echo "screenfetch" >> /root/.bashrc
RUN echo "echo" >> /root/.bashrc
RUN echo "set bell-style visible" >> /root/.bashrc

RUN cd /tmp/ ; rm -rf -- *

WORKDIR /root
