# RaspberryPi Challenge Server Installation Notes  

As root immediately after flashing with http://archlinuxarm.org/platforms/armv6/raspberry-pi  

## Change root password to something long and random  

	passwd  

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
 
	cp challenges/raspberrypi/AntiHuman/systemd/antihuman.service /usr/lib/systemd/system/  
	cp challenges/raspberrypi/BigAntiHuman/systemd/bigantihuman.service /usr/lib/systemd/system/
	systemctl enable antihuman.service  
	systemctl enable bigantihuman.service  
	systemctl start antihuman 
	systemctl start bigantihuman  


## Install Kippo honeypot  
### Add kippo unprivileged user  

	useradd -d /home/kippo -m -s /usr/bin/bash kippo

### Setup Python virtualenv for kippo  

	su - kippo  
	cd /home/kippo  
	mkdir kippo  
	virtualenv-2.7 kippo  
	cd kippo  
	source bin/activate  
	pip install twisted  
	pip install pycrypto  
	pip install pyasn1  

### Setup kippo in virtualenv  

	su - kippo  
	cd /home/kippo/kippo-0.8
	wget https://kippo.googlecode.com/files/kippo-0.8.tar.gz  
	tar xf kippo-0.8.tar.gz  
	rm kippo-0.8.tar.gz  


* Add dummy password values to /home/kippo/kippo/kippo-0.8/data/userdb.txt  
** http://www.zdnet.com/top-25-common-attackable-passwords-stop-using-ninja-and-jesus-7000006373/  

### Systemd scripts  

	cp challenges/raspberrypi/kippo/systemd/kippo.service /usr/lib/systemd/system/ 
	systemctl enable kippo.service  
	systemctl start kippo  

	
