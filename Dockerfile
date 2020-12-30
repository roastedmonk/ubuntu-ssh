FROM ubuntu:latest

RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -

RUN add-apt-repository ppa:deadsnakes/ppa

RUN apt update && apt install openssh-server sudo nodejs gcc g++ make software-properties-common python3.7 -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 ubuntu 

RUN  echo 'ubuntu:admin' | chpasswd

RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
