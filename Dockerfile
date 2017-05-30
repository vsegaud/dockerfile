FROM debian:jessie
MAINTAINER jean-marc Pouchoulon

# Let the container know that there is no tty

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true
ENV LC_ALL=fr_FR.UTF-8
ENV LANG=fr_FR.UTF-8

### Updating via our custom repository
#RUN echo "deb http://ftp.fr.debian.org/debian/ jessie main contrib non-free" > /etc/apt/sources.list
#RUN echo "deb http://httpredir.debian.org/debian jessie main" /etc/apt/sources.list 
#RUN echo "deb http://httpredir.debian.org/debian jessie-updates main" /etc/apt/sources.list
#RUN echo "deb http://security.debian.org jessie/updates main" /etc/apt/sources.list

#RUN echo 'Acquire::http { Proxy "http://registry.iutbeziers.fr:3142"; };' >> /etc/apt/apt.conf.d/01proxy
RUN echo "deb http://debian.iutbeziers.fr/debian/ jessie main contrib non-free"  > /etc/apt/sources.list
#RUN echo "deb http://security.debian.org/ jessie/updates main" >> /etc/apt/sources.list
#RUN echo "deb-src http://security.debian.org/ jessie/updates main"  >> /etc/apt/sources.list



RUN apt-get update && apt-get upgrade -y  && apt-get install -y \
#RUN apt-get install -y \
 git  \
 wget \
 curl \
 bzip2 \
 telnet \
 debconf \
 locales \
 apt-utils \
 debconf-utils \
 iproute2 \
 net-tools \
 sudo \
 vim \
 nano \
 python \
 openssh-client \
 man

ENV LC_ALL=fr_FR.UTF-8
ENV LANG=fr_FR.UTF-8
ENV LANGUAGE=fr_FR:fr
ENV LC_TIME=fr_FR.UTF-8
ENV LC_COLLATE=fr_FR.UTF-8
#ENV http_proxy='http://10.255.255.254:3128/'


RUN echo "Europe/Paris" > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata && \
    sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG="fr_FR.UTF-8"'>/etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=fr_FR.UTF-8



# Adding git user
RUN mkdir -p /home/git/.ssh


