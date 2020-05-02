0) Creer les répertoire de données
	mkdir -p /Master/VMs/data/owncloud
	mkdir -p /Master/VMs/data/mba
	mkdir -p /Backup/FileHistory

1) Create a VM from the Freeos console, with the following parameters:
	- 1 CPU
	- Mem: 500Mb
	- user: freebox
	- password: freebox
	- Distro: Debian
	- Size: 16G


2) Install Ansible on the control node (most likely your desktop):

	$ curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	$ python get-pip.py --user
	$ pip install --user ansible

3) Update the hosts file with the VM's IP

4) Mount Vault2 volume

5) Run the Ansible script

	$ ansible-playbook -i hosts --ask-pass playbook-system.yml (--ask-pass is required for the first run)
	Then reboot the VM.
	$ ansible-playbook -i hosts playbook-mynas.yml
