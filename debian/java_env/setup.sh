#!/bin/bash

#sudo apt-get update
#sudo apt-get install default-jre
#sudo apt-get install default-jdk

#Oracle official version
sudo apt-get install software-properties-common
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | sudo tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | sudo tee -a /etc/apt/sources.list.d/webupd8team-java.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
sudo apt-get update
sudo apt-get install oracle-java9-installer

sudo update-alternatives --config java

echo JAVA_HOME="/usr/lib/jvm/java-9-oracle" | sudo tee -a -i /etc/environment

