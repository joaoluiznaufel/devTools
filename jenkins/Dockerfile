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

RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823

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
    sbt \
    && pip3 install --upgrade pip \
    && apt-get clean

RUN curl -L https://github.com/docker/compose/releases/download/1.24.1/docker-compose-`uname -s`-`uname -m` > ~/docker-compose

RUN chmod +x ~/docker-compose

RUN mv ~/docker-compose /usr/local/bin/docker-compose

RUN chmod g+s /usr/local/bin/docker-compose

RUN pip3 --no-cache-dir install --upgrade awscli

RUN pip3 --no-cache-dir install --upgrade ansible

RUN usermod -aG docker jenkins

RUN chmod g+s /usr/bin/docker

USER jenkins
