FROM debian:latest
LABEL maintainer="h0st@ukr.net"

RUN useradd -ms /bin/bash ak


RUN apt-get update && \
      apt-get -y install sudo curl lsb-release
RUN adduser ak sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER ak
WORKDIR /home/ak  
COPY . /home/ak 

#RUN /bin/bash   
RUN sudo apt update -y && \ 
	bash bootstrap --noask