0) Creer les répertoire de données
	mkdir -p /Master/VMs/data/owncloud
	mkdir -p /Master/VMs/data/mba
	mkdir -p /Backup/FileHistory

1) Create a VM from the Freeos console, with the following parameters:
	- 2 CPU
	- Mem: maximum
	- user: freebox
	- Distro: Debian
	- Size: 16G
	- Public key: /Vault2/ssh-keys/pi.password/pi.raspberrypi.pub
	- Mount point with www-data user (id: 33)
	mounts:
	  - [ '//mafreebox.freebox.fr/Master/VMs/data/owncloud', '/mnt/owncloud', cifs, 'vers=1.0,guest,uid=33,gid=33', '0', '0' ]
	  - [ '//mafreebox.freebox.fr/Master/VMs/data/mba', '/mnt/mba', cifs, 'vers=1.0,guest,uid=1000,gid=1000', '0', '0' ]
	  - [ '//mafreebox.freebox.fr/Backup', '/mnt/Backup', cifs, 'vers=1.0,guest,uid=1000,gid=1000', '0', '0' ]

#cloud-config
ssh_authorized_keys:
  - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC3R5aWhRqjxbpW1pY1j3IM3fFkmcteZTXujK5eJzc7x28Wvt/gDLqp6ljy5dox+mxSxXw1cG5J9eARQI3L4FA/W7LdSWeHjW9UQm/7u7SpycIEtQSh0NcopoYqz6TLRGaOU4bFD4GZ9eKcWKjA0nEUtRrSJLymIn1uw/kie/KLwhHCXby+Cxg811hm7X3diTdu4sIJX8pd6TTOS7CPPAOvsFNOveycxohx3m1c4uPOphTrwffNpjq/UrEkvoGLyYuXn61TdNetUOQXtSPAw6hvhecGq/yFxdI4CA6SJEFhL2w3Clq1m0rmjPfqz/1XcMSjZZGSMPoY+IHNwwDQVoaR home@MacBook-Air-de-Home.local
system_info:
  default_user:
    name: freebox
packages_update: true
packages:
  - cifs-utils
mounts:
  - [ '//mafreebox.freebox.fr/Master/VMs/data/owncloud', '/mnt/owncloud', cifs, 'vers=1.0,guest,uid=33,gid=33', '0', '0' ]
  - [ '//mafreebox.freebox.fr/Master/VMs/data/mba', '/mnt/mba', cifs, 'vers=1.0,guest,uid=1000,gid=1000', '0', '0' ]
  - [ '//mafreebox.freebox.fr/Backup', '/mnt/Backup', cifs, 'vers=1.0,guest,uid=1000,gid=1000', '0', '0' ]
runcmd:
  - mount -a


2) Install Ansible on the control node (most likely your desktop):

	$ curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	$ python get-pip.py --user
	$ pip install --user ansible

3) Update the hosts file with the VM's IP

4) Run the Ansible script

	$ ansible-playbook -i hosts playbook-system.yml
	$ ansible-playbook -i hosts playbook-owncloud.yml
	$ ansible-playbook -i hosts playbook-mba.yml
	$ ansible-playbook -i hosts playbook-mynas.yml (need to mount Vault2 volume before executing)
