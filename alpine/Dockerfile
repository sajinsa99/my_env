FROM alpine

RUN apk update ; apk upgrade
RUN apk add  vim bash

ADD .alias /root/
ADD .vimrc /root/
ADD PS1.txt /root/

RUN chmod 700 /root/.vimrc ;\
    unalias -a ;\
    chmod 700 /root/.alias ;\
    echo ". .alias" >> /root/.bashrc ;\
    cat /root/PS1.txt >> /root/.bashrc ;\
    rm -f /root/PS1.txt ;\
    mkdir -p /root/trainings


ENTRYPOINT ["/bin/bash"]
WORKDIR /root
