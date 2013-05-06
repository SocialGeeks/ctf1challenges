# RaspberryPi In the Dark (rbash) Server

As root immediately after flashing with http://archlinuxarm.org/platforms/armv6/raspberry-pi  
## Update system and go do something else for a while  

	pacman -Syu  

## Add an administrative user  

	pacman -S sudo
	useradd -d /home/socialgeek -G wheel -m -s /usr/bin/bash socialgeek 

* Uncomment line in /etc/sudoers that allows wheel to use sudo  
* Edit /etc/shells and add /usr/bin/bash  

## SSH Configuration for public keys
* Uncommented "PubkeyAuthentication yes" in /etc/ssh/sshd_config  
* Made sure that "PermitRootLogin no" is set  
* Add your public ssh keys to /home/socialgeek/.ssh/authorized_keys  

### Restart sshd service  
  
	sudo systemctl restart sshd  

### Verify SSH config and login as administrator

## Disable Root Account

        sudo passwd -l root

## Some developer/comfort tools  

	sudo pacman -S vim nmap netcat git base-devel screen

## Create Sandboxed user

	sudo ln /bin/bash /bin/rbash
	sudo groupadd sandbox
	sudo useradd -g sandbox -G users -m -s /bin/rbash hacker
	sudo passwd hacker   # (h@x0r)

## Creating the CHROOT Enviroment

### Create Folder Structure

	sudo mkdir -p /sandbox/{bin,lib,user/lib,dev,home/hacker}
	sudo mknod /sandbox/dev/null c 1 3
	sudo mknod /sandbox/dev/zero c 1 5
	sudo chmod 0666 /sandbox/dev/{zero,null}
	sudo chown root:root /sandbox/home/hacker
	sudo chmod 655 /sandobx/home/hacker

### Add rbash to sandbox (make sure the bin name is rbash)

	sudo cp -p /bin/bash /sandbox/bin/rbash

### Add shared libs required by rbash

	ldd /bin/bash
	# parse list and ajust the following as required
	# Replace x with the correct version number
	sudo cp -p /usr/lib/{libreadline.so.x,libncursesw.so.x,libdl.so.x,libgcc_s.so.x,libc.so.x} /lib/ld-linux.so.x /sandbox/lib
	sudo ln /sandbox/lib/{libreadline.so.x,libncursesw.so.x,libdl.so.x,libgcc_s.so.x,libc.so.x} /sandbox/usr/lib/

## Add Rbash to shell list
* Add /bin/rbash to /etc/shells

## Lockdown SSH and configure SSH Sandbox
* Uncomment Protocal 2
* Set PasswordAuthentication no
* Add the following to the bottom
	Match Group sandbox
	  PasswordAuthentication yes
	  ChrootDirectory /sandbox/
	  AllowTcpForwarding no

### Reload SSH

	sudo systemctl restart sshd

## Add the key to the direcotry

	sudo su
	cat >> /sandbox/home/hacker/secret << EOF
	#!/bin/rbash
	echo key: < .. key .. >
	EOF
	chmod +x /sandbox/home/hacker/secret
	exit
	
## Add ~ to the path statment via bash_profile

	sudo su
	cat >> /sandbox/home/hacker/.bash_profile << EOF
	[[ -f ~/.bashrc ]] && . ~/.bashrc
	
	export PATH=$PATH:/home/hacker
	EOF
	exit

