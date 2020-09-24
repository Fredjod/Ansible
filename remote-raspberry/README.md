
1) Create a boot disk for raspberry on SD Card
- download the raspbian distro (Lite): https://www.raspberrypi.org/downloads/raspbian/
- unzip the image
- run balenaEtcher for burning the image on the SD
- add 'ssh' file in the boot partition

	$ touch /Volumes/boot/ssh
	ou
	$ type nul > X:\ssh (CMD Windows)


2) Install Ansible on the control node (most likely your desktop):

	$ curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	$ python get-pip.py --user
	$ pip install --user ansible
	$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	$ brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb

3) Mount Vault2 volume

4) Update the ansible hosts file with appropriate values
	For getting the host USB drive UUID and name, connect to the raspberry (ssh with ID pi/raspberry), then run:
   		$ sudo blkid

   	The spindown time value, is the time in seconds divided by 5. Sample : 1h = 3600s => 720.

5) Run the Ansible script

	$ ansible-playbook -i hosts --ask-pass ssh.yml (--ask-pass is required for the first run)
	May need to install sshpass :
		$ brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb
	And may need to connect once from a regular ssh command line (for initializing the fingerprints on your localhost)

	At the end of the first playbook execution, reboot the raspberry ( $ sudo shutdown -hr now )

	Then the command line is :
	$ ansible-playbook -i hosts playbook.yml

6) Hdparm checking (for USB disk management )

   	For making sure the drive supports hdparm standby command (replace sdx by the your drive's name), run:
    	$ sudo hdparm -y /dev/sdx
    	If OK, the output should be :
    		> /dev/sdx:
    		>   issuing standby command
    
    For making sure the drive supports write cache
    	$ sudo hdparm -I /dev/sdx | grep 'Write cache'
    	If you see an asterix, it's OK
    		> *    Write cache
