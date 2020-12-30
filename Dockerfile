FROM ubuntu:latest

RUN add-apt-repository ppa:deadsnakes/ppa

RUN apt update && apt install openssh-server sudo curl gcc g++ make software-properties-common python3.7 -y

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -

RUN apt update && apt install nodejs -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 ubuntu 

RUN  echo 'ubuntu:admin' | chpasswd

RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
