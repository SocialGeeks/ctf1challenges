# RaspberryPi In the Dark (rbash) Server

As root immediately after flashing with http://archlinuxarm.org/platforms/armv6/raspberry-pi  
## Update system and go do something else for a while  

	pacman -Syu  

## Change root password to something long and random  

	pacman -S apg  
	apg -m20 -x20  
	passwd  
	
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
  
	systemctl restart sshd  

## Some developer/comfort tools  

	pacman -S vim nmap netcat git base-devel  

