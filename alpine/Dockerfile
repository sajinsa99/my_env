FROM alpine:20191114

RUN apk update ; apk upgrade

ADD .alias /root/
ADD .vimrc /root/
ADD PS1.txt /root/

RUN apk add  vim
RUN apk add  bash

RUN chmod 700 /root/.vimrc ;\
    unalias -a ;\
    chmod 700 /root/.alias ;\
    echo ". .alias" >> /root/.bashrc ;\
    cat /root/PS1.txt >> /root/.bashrc ;\
    rm -f /root/PS1.txt ;\
    mkdir -p /root/trainings


ENTRYPOINT ["/bin/bash"]
WORKDIR /root
