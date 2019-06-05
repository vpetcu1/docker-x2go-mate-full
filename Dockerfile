FROM vpetcu1/x2go-mate-base
MAINTAINER Vasilica Petcu <vpetcu1@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

USER root

# install x2go and Mate
RUN apt-get install -y x2goserver x2goserver-xsession x2gomatebindings
RUN apt-get install -y ubuntu-mate-desktop
    
RUN apt-get install -y mate-tweak
RUN apt-get install -y numix-blue-gtk-theme numix-icon-theme 

#clean up
RUN rm -rf /tmp/*

RUN apt-get -y autoclean && apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*

EXPOSE 22
