FROM vpetcu1/x2go-mate-base-20.04
MAINTAINER Vasilica Petcu <vpetcu1@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

USER root

# install x2go and Ubuntu Mate
RUN apt-get update && apt-get install -y ubuntu-mate-desktop
    
#clean up
RUN rm -rf /tmp/*

RUN apt-get -y autoclean && apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*

COPY ["*.sh", "/"]
RUN chmod +x /*.sh

RUN sh /x2go-mate-full-entrypoint.sh
EXPOSE 22
ENTRYPOINT ["/start-supervisor.sh"]
