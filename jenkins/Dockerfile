FROM jenkins/jenkins:lts

USER root

#docker preparation
RUN apt-get update

RUN apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

RUN apt-key fingerprint 0EBFCD88

RUN add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/debian \
       $(lsb_release -cs) \
       stable"

RUN apt-get update

RUN apt-get install -y \
    vim \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    python3-pip \
    python3-setuptools \
    groff \
    less \
    && pip3 install --upgrade pip \
    && apt-get clean

RUN pip3 --no-cache-dir install --upgrade awscli

RUN usermod -aG docker,staff jenkins

RUN chmod g+s /usr/bin/docker

USER jenkins