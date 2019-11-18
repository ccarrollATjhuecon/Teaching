# Dockerfile built largely following pattern of:
# http://www.science.smith.edu/dftwiki/index.php/Tutorial:_Docker_Anaconda_Python_--_4

# 18.04 is the latest "Long Term Support" version of Ubuntu as of 2019-09-14
FROM ubuntu:18.04

SHELL ["/bin/bash", "-c"]

MAINTAINER ccarrollATjhuecon <ccarroll@jhuecon.org>

# Upgrade everything that has changed since the release 
RUN apt-get update && yes|apt-get upgrade

# emacs for text editing
RUN apt-get install -y emacs

# Essential tools
RUN apt-get install -y wget bzip2 sudo

# TeXLive
RUN apt-get update -y && apt-get install -yq --no-install-recommends \
	texlive-latex-base \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    && apt-get clean

# Create jhuecon user -- after creating the user, the rest of the script is run as that user
RUN adduser --disabled-password --gecos '' jhuecon

# Give sudo powers to jhuecon user
RUN adduser jhuecon sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER jhuecon
WORKDIR /home/jhuecon
RUN chmod a+rwx /home/jhuecon

# Get Anaconda, install in the default location, then delete the (big) installer 
RUN wget https://repo.continuum.io/archive/Anaconda3-2019.07-Linux-x86_64.sh
RUN bash Anaconda3-2019.07-Linux-x86_64.sh -b 
RUN rm   Anaconda3-2019.07-Linux-x86_64.sh

# Set path to conda
ENV PATH /home/jhuecon/anaconda3/bin:$PATH

# Update Anaconda packages
RUN conda update conda && conda update anaconda && conda update --all && conda init bash
RUN conda install seaborn

# Update pip install
RUN pip install --upgrade pip

# Create "ark" environment for econ-ark
RUN conda create --name ark --clone base
RUN echo "source activate ark" >> /home/jhuecon/.bashrc && chmod a+r /home/jhuecon/.bashrc 
ENV PATH /home/jhuecon/anaconda3/envs/ark/bin:$PATH

# Econ-ARK
RUN source activate ark && conda install -c conda-forge econ-ark

