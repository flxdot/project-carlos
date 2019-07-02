#!/bin/sh

################
# Python 3.7.0 #
################

# First install the dependencies needed to build
sudo apt-get update
sudo apt-get install -y build-essential tk-dev libncurses5-dev libncursesw5-dev libreadline6-dev libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev libffi-dev

# Compile (takes a while!)
wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tar.xz
tar xf Python-3.7.0.tar.xz
cd Python-3.7.0
./configure --prefix=/usr/local/opt/python-3.7.0
make -j 4

# install
sudo make altinstall

# Make Python 3.7 the default version, make aliases
sudo ln -s /usr/local/opt/python-3.7.0/bin/pydoc3.7 /usr/bin/pydoc3.7
sudo ln -s /usr/local/opt/python-3.7.0/bin/python3.7 /usr/bin/python3.7
sudo ln -s /usr/local/opt/python-3.7.0/bin/python3.7m /usr/bin/python3.7m
sudo ln -s /usr/local/opt/python-3.7.0/bin/pyvenv-3.7 /usr/bin/pyvenv-3.7
sudo ln -s /usr/local/opt/python-3.7.0/bin/pip3.7 /usr/bin/pip3.7
alias python='/usr/bin/python3.7'
alias python3='/usr/bin/python3.7'
ls /usr/bin/python*
cd ..
sudo rm -r Python-3.7.0
rm Python-3.7.0.tar.xz
. ~/.bashrc

############
# InfluxDB #
############

# install influxdb
curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
echo "deb https://repos.influxdata.com/debian stretch stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
sudo apt update
sudo apt install influxdb

# start influx db
sudo systemctl enable influxdb
sudo systemctl start influxdb
