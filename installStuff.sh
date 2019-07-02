#!/bin/bash

PACKAGES=('python3.6' 'python3-venv' 'docker-ce' 'docker-ce-cli' 'containerd.io') 

echo "Updating apt-get"

apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update


for p in "${PACKAGES[@]}"; do 
	
	C=$(dpkg -l $p | grep -c "Version")

	if [[ $C -gt 0 ]]; then
		echo "${p} installed - skip."
	else
		echo "${p} not installed."
		echo "Installing ${p}..."
		apt-get install $p
	fi
done

echo "Setting python3.6 as default..."
rm /usr/bin/python
ln -s /usr/bin/python3 /usr/bin/python
echo "Installing PIP..."
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py

