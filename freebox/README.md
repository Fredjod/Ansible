0) Creer les répertoire de données
	mkdir -p /Master/VMs/data/owncloud
	mkdir -p /Master/VMs/data/mba
	mkdir -p /Master/VMs/data/logs
	mkdir -p /Backup/FileHistory

1) Create a VM from the Freeos console, with the following parameters:
	- 1 CPU
	- Mem: 600Mb
	- user: freebox
	- password: freebox (gona be changed with key authentification)
	- Distro: Debian
	- Size: 16G


2) Install Ansible on the control node (most likely your desktop):

	$ curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	$ python3 get-pip.py --user
	$ pip3 install --user ansible
	$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	$ brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb

3) Update the hosts file with the VM's IP

4) Mount Vault3 volume

5) Run the Ansible scripts

	$ ansible-playbook -i hosts --ask-pass playbook-system.yml (--ask-pass is required for the first run)
	Then reboot the VM (the first time).
	$ ansible-playbook -i hosts playbook-mynas.yml
	$ ansible-playbook -i hosts playbook-logchecker.yml 


6) Restore command line sample:

	Connect on the Freeos VM,
	Create a restore folder in the Backup volume, and then execute :
	$ scp -Cpr -i .ssh/pi.xxxxx pi@chrisal.xxxx.xx:/mnt/backup/xxxx.backup/VMs/data/owncloud/data/config /mnt/Backup/restore

Note: in case MacOSX timemachine bundle becomes too large (due to too old files history), use tmutil command line tool.
Exemple for removing all 2020 backups:
	$ tmutil listbackups
	$ sudo tmutil delete /Volumes/Copies\ de\ sauvegarde\ Time\ Machine/Backups.backupdb/MacBook\ Pro\ de\ Frederic/2020*