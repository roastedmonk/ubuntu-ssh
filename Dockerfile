FROM ubuntu:latest

RUN apt update && apt install openssh-server sudo curl gcc g++ git zip unzip make wget software-properties-common -y

RUN wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add -
RUN echo "deb https://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list
RUN add-apt-repository ppa:deadsnakes/ppa
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -

RUN apt update && apt install cf7-cli nodejs python3.7 -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 ubuntu 

RUN  echo 'ubuntu:admin' | chpasswd

RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
