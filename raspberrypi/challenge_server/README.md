# RaspberryPi Challenge Server Installation Notes  

As root immediately after flashing with http://archlinuxarm.org/platforms/armv6/raspberry-pi  

## Update system and go do something else for a while  

	pacman -Syu  

## Add an administrative user  

	useradd -d /home/socialgeek -G wheel -m -s /usr/bin/bash socialgeek 

## SSH Configuration for public keys
* Uncommented "PubkeyAuthentication yes" in /etc/ssh/sshd_config  
* Made sure that "PermitRootLogin no" is set  
* Add your public ssh keys to /home/socialgeek/.ssh/authorized_keys  

### Restart sshd service  
  
	systemctl restart sshd  

## Some developer/comfort tools  

	pacman -S sudo vim nmap nc git base-devel  

## PHP Challenges  

	pacman -S apache php-apache php  

* Add "LoadModule php5_module modules/libphp5.so" to /etc/httpd/conf/httpd.conf   
* at the bottom of the rest of the LoadModule statements  
* Add "Include conf/extra/php5_module.conf" to the bottom of the "Include conf/extra" section  
* Copy files from https://github.com/socialgeeks/challenges/php/* to /srv/http/  

### Restart Apache  

	systemctl enable httpd.service  
	systemctl start httpd  

### Update permissions

	chown http:http /srv/http/*  

## Install node.js challenges  

	pacman -S nodejs  

### Add non-privileged users to run the node.js challenges as  

	useradd -d /home/ctfuser -m -s /sbin/nologin ctfuser 

* Copy files from https://github.com/SocialGeeks/challenges/tree/master/raspberrypi/challenge_server/AntiHuman to /home/ctfuser/AntiHuman  
* Copy files from https://github.com/SocialGeeks/challenges/tree/master/raspberrypi/challenge_server/BigAntiHuman to /home/ctfuser/BigAntiHuman  

### Update permissions  

	chown -R ctfuser:ctfuser /home/ctfuser/  

### Systemd scripts  
 
	cp systemd/antihuman.service /usr/lib/systemd/system/  
	cp systemd/bigantihuman.service /usr/lib/systemd/system/
	systemctl enable antihuman.service  
	systemctl enable bigantihuman.service  
	systemctl start antihuman 
	systemctl start bigantihuman  

