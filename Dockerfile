FROM centos:centos7.7.1908



RUN rm -f /etc/localtime ; ln -s /usr/share/zoneinfo/CET /etc/localtime
#RUN yum -y install glibc-langpack-en
RUN yum -y install epel-release
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.rpm.sh | bash
RUN yum -y upgrade

#RUN yum -y install ansible
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
#RUN yum -y install groovy
RUN yum -y install htop
RUN yum -y install iftop
RUN yum -y install iotop
RUN yum -y install iptables
RUN yum -y install iptraf-ng
RUN yum -y install lshw
RUN yum -y install lsof
#RUN yum -y install maven
RUN yum -y install mc
RUN yum -y install mlocate
RUN yum -y install nc
RUN yum -y install net-tools
RUN yum -y install ngrep
RUN yum -y install nload
RUN yum -y install nmap
RUN yum -y install nmon
#RUN yum -y install nodejs
#RUN yum -y install perl
RUN yum -y install powertop
RUN yum -y install psacct
#RUN yum -y install python3
#RUN yum -y install python3-pip
#RUN yum -y install ruby
RUN yum -y install saidar
RUN yum -y install strace
RUN yum -y install sysstat
RUN yum -y install telnet
RUN yum -y install tmux
RUN yum -y install traceroute
RUN yum -y install tree
RUN yum -y install unzip
RUN yum -y install wget
RUN yum -y install which
RUN yum -y install zip

# install compiles for compile ruby, python, vim
RUN yum -y install make gcc-c++ ncurses-devel python-devel
RUN yum -y install curl-devel expat-devel gettext-devel perl-ExtUtils-MakeMaker zlib-devel openssl openssl-libs openssl-devel

RUN yum -y upgrade
RUN updatedb


# instell chefdk
RUN curl https://omnitruck.chef.io/install.sh | bash -s -- -P chefdk -c stable -v 4.6.35
#RUN pip3 install --upgrade pip
#RUN pip3 install --upgrade pip;pip3 list --outdated --format=freeze | grep -v ^-e | cut -d = -f 1 | xargs -n1 pip3 install -U
#RUN gem install rubygems-update;update_rubygems;gem update --system;gem update

ADD screenfetch /usr/bin/
RUN chmod 755 /usr/bin/screenfetch
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
RUN echo >> /root/.bashrc

# compile & install vim
ARG VIM_VERSION=8.1.2414
ARG VIM_MAJORVERSION=8
RUN echo install vim $VIM_MAJORVERSION
ADD vim-$VIM_VERSION.tar.gz /root/
RUN mkdir -p /opt/vim$VIM_MAJORVERSION
RUN cd /root/vim-$VIM_VERSION/src ; ./configure --disable-nls --enable-cscope --enable-gui=no --enable-multibyte --enable-pythoninterp --enable-rubyinterp --with-features=huge --with-tlib=ncurses --quiet --prefix=/opt/vim$VIM_MAJORVERSION >& /dev/null
RUN cd /root/vim-$VIM_VERSION/src ; make all >& /dev/null ; make install >& /dev/null ; ldconfig >& /dev/null
RUN cd /root/ ; rm -rf vim-$VIM_VERSION ;

# install perl
ARG PERL_VERSION=5.26.3.0000
ARG PERL_SHORTVERSION=5.26
ARG PERL_VERSIONSUFFIX=x86_64-linux-glibc-2.12-432e1938
RUN echo install Active Perl $PERL_SHORTVERSION
ADD ActivePerl-$PERL_VERSION.tar.gz /root/
RUN cd /root ; mv ActivePerl-$PERL_VERSION-$PERL_VERSIONSUFFIX ActivePerl-$PERL_VERSION
RUN cd /root/ActivePerl-$PERL_VERSION/ ; yes | ./install.sh >& /dev/null
RUN cd /root/ ; rm -rf ActivePerl-$PERL_VERSION
RUN /opt/ActivePerl-$PERL_SHORTVERSION/bin/ppm upgrade --install

# install ruby
ARG RUBY_VERSION=2.6.5
RUN echo install ruby $RUBY_VERSION
ADD ruby-$RUBY_VERSION.tar.gz /root/
RUN mkdir -p /opt/ruby$RUBY_VERSION ; cd /root/ruby-$RUBY_VERSION ; ./configure --prefix=/opt/ruby$RUBY_VERSION >& /dev/null
RUN cd /root/ruby-$RUBY_VERSION  ; make all >& /dev/null ; make install >& /dev/null ; ldconfig >& /dev/null  ; cd /root/ ; rm -rf ruby-$RUBY_VERSION

# install python
ARG PYTHON_VERSION=3.8.0
RUN echo install python3 $PYTHON_VERSION
ADD Python-$PYTHON_VERSION.tgz /root/
RUN mkdir -p /opt/python$PYTHON_VERSION ; cd /root/Python-$PYTHON_VERSION ; ./configure --prefix=/opt/python$PYTHON_VERSION >& /dev/null
RUN cd /root/Python-$PYTHON_VERSION  ; make all >& /dev/null ; make install >& /dev/null ; ldconfig >& /dev/null  ; cd /root/ ; rm -rf Python-$PYTHON_VERSION
#RUN echo "export PATH=/opt/python$PYTHON_VERSION:$PATH" >> /root/.bashrc
RUN cd /root/ ; wget https://bootstrap.pypa.io/get-pip.py >& /dev/null
RUN /opt/python$PYTHON_VERSION/bin/python3 /root/get-pip.py >& /dev/null ; /usr/bin/python /root/get-pip.py >& dev/null ; rm -f /root/get-pip.py
RUN /opt/python$PYTHON_VERSION/bin/pip3 install virtualenv >& /dev/null
RUN /usr/bin/pip install virtualenv >& /dev/null
#RUN /opt/python$PYTHON_VERSION/bin/pip3 install --upgrade pip;/opt/python$PYTHON_VERSION/bin/pip3 list --outdated --format=freeze | grep -v ^-e | cut -d = -f 1  | xargs -n1 /opt/python$PYTHON_VERSION/bin/pip3 install -U

RUN /opt/ruby$RUBY_VERSION/bin/gem install rubygems-update >& /dev/null
RUN yes | /opt/ruby$RUBY_VERSION/bin/update_rubygems       >& /dev/null
RUN /opt/ruby$RUBY_VERSION/bin/gem update --system         >& /dev/null
RUN yes | /opt/ruby$RUBY_VERSION/bin/gem update            >& /dev/null

RUN yum -y install file

ARG GROOVY_VERSION=2.5.8
ADD apache-groovy-sdk-$GROOVY_VERSION.zip /opt/
RUN cd /opt ; unzip apache-groovy-sdk-$GROOVY_VERSION.zip >& /dev/null ; rm -f apache-groovy-sdk-$GROOVY_VERSION.zip

RUN echo "export PATH=/opt/vim$VIM_MAJORVERSION/bin/:/opt/ActivePerl-$PERL_SHORTVERSION/bin:/opt/ruby$RUBY_VERSION/bin:$PATH" >> /root/.bashrc


WORKDIR /root
