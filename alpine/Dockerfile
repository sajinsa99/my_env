FROM alpine

LABEL maintainer="bruno.fablet@sap.com"

RUN apk update ; apk upgrade

# install some tools
RUN apk add --no-cache vim bash tree wget curl git openssh-client openssl dos2unix terraform perl ruby

# set some custom env
ADD .alias /root/
ADD .vimrc /root/
ADD PS1.txt /root/

RUN chmod 700 /root/.vimrc ;\
    unalias -a ;\
    chmod 700 /root/.alias ;\
    echo ". .alias" >> /root/.bashrc ;\
    cat /root/PS1.txt >> /root/.bashrc ;\
    rm -f /root/PS1.txt ;\
    cd /root/ ; mkdir -p trainings .ssh .prodpassaccess

# install python3 and pip
ENV PYTHONUNBUFFERED=1
RUN echo "**** install Python ****" && \
    apk add --no-cache python3 && \
    if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
    \
    echo "**** install pip ****" && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools wheel && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi

# install pre-requesites for openstack
RUN apk add --no-cache python3-dev ca-certificates gcc libffi-dev openssl-dev musl-dev linux-headers

# install openstack
RUN pip install --upgrade --no-cache-dir pip setuptools python-openstackclient

# remove some openstack pre-requisites
RUN apk del gcc musl-dev linux-headers libffi-dev ; rm -rf /var/cache/apk/*

# install ansible
RUN pip install ansible

# install k8
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl ;\
	chmod +x kubectl ; mv ./kubectl /usr/local/bin/kubectl

#### install jdk + groovy + prodpassaccess
# jdk
# RUN apk add --no-cache openjdk8
# ENV JAVA_HOME=/usr/lib/jvm/default-jvm
# groovy
# ARG GROOVY_VERSION=2.5.8@
# RUN cd /opt ; curl -L https://bintray.com/artifact/download/groovy/maven/apache-groovy-binary-$GROOVY_VERSION.zip -o groovy.zip ;\
#	  unzip groovy.zip ; ln -s /opt/groovy-$GROOVY_VERSION/bin/grovy /usr/local/bin/groovy ; rm -f /opt/groovy.zip
# prodpassaccess tool
# ARG PPA_VERSION=4.1
# RUN cd /opt ; wget

# ENV PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:/opt/prodpasscess$PPA_VERSION:${PATH}



ENTRYPOINT ["/bin/bash"]
WORKDIR /root
