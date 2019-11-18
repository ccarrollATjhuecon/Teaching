# Dockerfile built largely following pattern of:
# http://www.science.smith.edu/dftwiki/index.php/Tutorial:_Docker_Anaconda_Python_--_4

# 18.04 is the latest "Long Term Support" version of Ubuntu as of 2019-09-14
FROM ubuntu:18.04

MAINTAINER ccarrollATjhuecon <ccarroll@jhuecon.org>

# Upgrade everything that has changed since the release 
RUN apt-get update && yes|apt-get upgrade

# emacs for text editing
RUN apt-get install -y emacs

# Essential tools
RUN apt-get install -y wget bzip2 sudo

# Create jhuecon user
RUN adduser --disabled-password --gecos '' jhuecon

# Give sudo powers to jhuecon user
RUN adduser jhuecon sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER jhuecon
WORKDIR /home/jhuecon
RUN chmod a+rwx /home/jhuecon

