FROM vpetcu1/x2go-mate-base
MAINTAINER Vasilica Petcu <vpetcu1@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

USER root

# install x2go and Ubuntu Mate
RUN apt-get update && apt-get install -y ubuntu-mate-desktop
    
#install mate-tweak
RUN apt-get install -y mate-tweak

#clean up
RUN rm -rf /tmp/*

RUN apt-get -y autoclean && apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*

EXPOSE 22
ENTRYPOINT ["/x2go-mate-full-entrypoint.sh"]