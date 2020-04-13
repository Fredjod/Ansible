1) Create a VM from the Freeos console, with the following parameters:
	- 2 CPU
	- Mem: maximum
	- user: freebox
	- Size: 16G
	- Public key: /Vault2/ssh-keys/pi.password/pi.raspberrypi.pub

2) Install Ansible on the control node (most likely your desktop):

	$ curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	$ python get-pip.py --user
	$ pip install --user ansible

3) Update the hosts file with the VM's IP

4) Run the Ansible script

	$ ansible-playbook -i hosts playbook-system.yml
	$ ansible-playbook -i hosts playbook-owncloud.yml