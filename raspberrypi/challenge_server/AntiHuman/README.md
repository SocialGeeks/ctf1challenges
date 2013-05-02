# Anti-Human Captcha - Robot Liberation

This is a simple time sensitive math question. The user has 500 miliseconds to send the correct answer to random addition questions.

## Dependencies
### System Packages
* Nodejs

### Install with node package manager..  

	npm install express  
	npm install jade  

### Systemd  

	useradd -d /home/ctfuser -m -s /sbin/nologin ctfuser  
	cp systemd/antihuman.service /usr/lib/systemd/system/  
	systemctl enable antihuman.service  
	systemctl start antihuman  

### Other files

local.sh is a example on how to solve the challenge.
