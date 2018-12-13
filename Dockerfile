FROM centos:6
LABEL maintainer "Mark Howison <mhowison@brown.edu>"
LABEL repository kantorlab
LABEL image conda-build
LABEL tag 20181212

RUN yum update -y
RUN yum install -y \
  java-1.8.0-openjdk-headless \
  java-1.8.0-openjdk-devel \
  patch \
  sudo \
  tree \
  unzip \
  wget \
  which \
  zip

RUN yum clean all

RUN useradd -m -d /home/conda -s /bin/bash conda
RUN echo "conda ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/conda \
 && chmod 0440 /etc/sudoers.d/conda

USER conda
ENV HOME /home/conda

RUN cd /home/conda \
 && wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh \
 && bash Miniconda3-latest-Linux-x86_64.sh -b \
 && rm Miniconda3-latest-Linux-x86_64.sh

ENV PATH /home/conda/miniconda3/bin:$PATH

RUN conda install -y conda-build conda-verify anaconda-client git
RUN conda clean -ay
