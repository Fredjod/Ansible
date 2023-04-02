0) Creer les répertoire de données
	mkdir -p /Master/VMs/data/owncloud
	mkdir -p /Master/share
	mkdir -p /Master/VMs/data/mba
	mkdir -p /Master/VMs/data/logs
	mkdir -p /Backup/FileHistory
	mkdir -p /Master/minetest

1) Create a boot disk for raspberry on SD Card
- download the raspbian distro (Lite): https://www.raspberrypi.org/downloads/raspbian/
- unzip the image
- run belenaEtcher for burning the image on the SD
- add 'ssh' file in the boot partition

	$ touch /Volumes/boot/ssh


2) Install Ansible on the control node (most likely your desktop):

	$ curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	$ python3 get-pip.py --user
	$ pip3 install --user ansible
	$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	$ brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb


3) Update the hosts file with the VM's IP

4) Mount Vault3 volume

5) Redirect the 80, 443 ports of the Internet box to he raspberry. 80 is mandatory for gettting SSL certificat with certbot (LetsEncrypt)

6) Run the Ansible script

	$ ansible-playbook -i hosts --ask-pass playbook-system.yml (--ask-pass is required for the first run)
	reboot the raspberry ( $ sudo shutdown -hr now )
	$ ansible-playbook -i hosts playbook-owncloud.yml
	$ ansible-playbook -i hosts playbook-reverse.yml
	$ ansible-playbook -i hosts playbook-mba.yml
	$ ansible-playbook -i hosts playbook-minetest.yml

