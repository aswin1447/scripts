#!/bin/bash

#script to install CERN-ROOT on a linux machine

#2nd February 2020.a.vi

#necessary dependencies
sudo apt-get install git cmake dpkg-dev python-dev make g++ gcc binutils libx11-dev libxpm-dev libxft-dev libxext-dev
#additional dependencies
sudo apt-get install gfortran libssl-dev libpcre3-dev xlibmesa-glu-dev libglew1.5-dev libftgl-dev libmysqlclient-dev libfftw3-dev graphviz-dev libavahi-compat-libdnssd-dev libldap2-dev libxml2-dev libkrb5-dev libgsl0-dev libqt4-dev


#installing pip

pip install --upgrade pip

#upgrading cmake

pip install --upgrade cmake

cd /usr/local/


#cloning from github

sudo git clone --depth 1 https://github.com/root-mirror/root.git


#permissions
sudo chown -R $(whoami):$(id -g -n $(whoami)) root


cd root

mkdir compile

cd compile

cmake -Dpython=ON -Droofit=ON -DCMAKE_INSTALL_PREFIX:PATH=/usr/local/root ..




make -j$(nproc)



sudo make install

cd /usr/local/root



source bin/thisroot.sh



echo " #CERN ROOT
export ROOTSYS=/usr/local/root
export PATH=$ROOTSYS/bin:$PATH
export PYTHONDIR=$ROOTSYS
export LD_LIBRARY_PATH=$ROOTSYS/lib:$PYTHONDIR/lib:$ROOTSYS/bindings/pyroot:$LD_LIBRARY_PATH
export PYTHONPATH=$ROOTSYS/lib:$PYTHONPATH:$ROOTSYS/bindings/pyroot " >> ~/.bashrc




bash
