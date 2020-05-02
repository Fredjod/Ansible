0) Creer les répertoire de données
	mkdir -p /Master/VMs/data/owncloud
	mkdir -p /Master/VMs/data/mba
	mkdir -p /Master/VMs/data/logs
	mkdir -p /Backup/FileHistory

1) Create a boot disk for raspberry on SD Card
- download the raspbian distro (Lite): https://www.raspberrypi.org/downloads/raspbian/
- unzip the image
- run belenaEtcher for burning the image on the SD
- add 'ssh' file in the boot partition
	$ touch /Volumes/boot/ssh


2) Install Ansible on the control node (most likely your desktop):

	$ curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	$ python get-pip.py --user
	$ pip install --user ansible
	$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	$ brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb


3) Update the hosts file with the VM's IP

4) Mount Vault2 volume

5) Run the Ansible script

	$ ansible-playbook -i hosts --ask-pass playbook-system.yml (--ask-pass is required for the first run)
	reboot the raspberry ( $ sudo shutdown -hr now )
	$ ansible-playbook -i hosts playbook-owncloud.yml
	$ ansible-playbook -i hosts playbook-mba.yml
	$ ansible-playbook -i hosts playbook-mynas.yml (need to mount Vault2 volume before executing)
