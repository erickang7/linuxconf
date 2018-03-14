#!/bin/bash

sudo yum install -y vim wget curl java-1.8.0-openjdk-devel.x86_64 golang
sudo yum -y install https://centos7.iuscommunity.org/ius-release.rpm
sudo yum -y install python36u python36u-pip python36u-devel python36u-setuptools
sudo pip3.6 install numpy pandas scipy scikit-learn cython matplotlib


#docker
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install -y docker-ce docker-compose

sudo groupadd docker
sudo usermod -aG docker $USER