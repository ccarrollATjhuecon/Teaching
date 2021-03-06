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

# Get Anaconda, install in the default location, then delete the (big) installer 
RUN wget https://repo.continuum.io/archive/Anaconda3-2019.07-Linux-x86_64.sh
RUN bash Anaconda3-2019.07-Linux-x86_64.sh -b 
RUN rm   Anaconda3-2019.07-Linux-x86_64.sh

# Set path to conda
ENV PATH /home/jhuecon/anaconda3/bin:$PATH

# Update Anaconda packages
RUN conda update conda
RUN conda update anaconda
RUN conda update --all
RUN conda install seaborn

ENV CONDA_ENV_NAME=ark
run /home/$SETUSER/anaconda3/condabin/conda create -q --name $CONDA_ENV_NAME python=3.7 && \
    /home/$SETUSER/anaconda3/condabin/conda clean --yes --all \
    /home/$SETUSER/anaconda3/condabin/conda activate base # For testing anaconda environment

# Configure access to Jupyter
RUN mkdir /home/jhuecon/notebooks
run jupyter notebook --generate-config --allow-root
RUN echo "c.NotebookApp.password = u'sha1:6a3f528eec40:6e896b6e4828f525a6e20e5411cd1c8075d68619'" >> /home/jhuecon/.jupyter/jupyter_notebook_config.py

# Make Jupyter listen on port :8888
EXPOSE 8888

# Update pip install
RUN pip install --upgrade pip

