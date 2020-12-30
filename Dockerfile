FROM ubuntu:latest

RUN apt update && apt install openssh-server sudo curl gcc g++ git unzip make software-properties-common -y

RUN add-apt-repository ppa:deadsnakes/ppa

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -

RUN apt update && apt install nodejs python3.7 -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 ubuntu 

RUN  echo 'ubuntu:admin' | chpasswd

RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
