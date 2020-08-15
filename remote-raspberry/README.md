
1) Create a boot disk for raspberry on SD Card
- download the raspbian distro (Lite): https://www.raspberrypi.org/downloads/raspbian/
- unzip the image
- run balenaEtcher for burning the image on the SD
- add 'ssh' file in the boot partition

	$ touch /Volumes/boot/ssh


2) Install Ansible on the control node (most likely your desktop):

	$ curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	$ python get-pip.py --user
	$ pip install --user ansible
	$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	$ brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb

3) Mount Vault2 volume

4) Update the hosts file with appropriate values

5) Run the Ansible script

	$ ansible-playbook -i hosts --ask-pass playbook.yml (--ask-pass is required for the first run)
	May need to install sshpass :
		$ brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb
	And need to connect once from a regular ssh command line (for initializing the fingerprints on your localhost)
	reboot the raspberry ( $ sudo shutdown -hr now )

	Then the command line is always :
	$ ansible-playbook -i hosts playbook.yml


