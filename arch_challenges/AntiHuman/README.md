# Anti-Human Captcha - Robot Liberation

This is a simple time sensitive math question. The user has 500 miliseconds to send the correct answer to random addition questions.  The ideas was lifted in almost its entirety from the 2013 HackYou CTF PPC100 challenge.  http://www.hacksonville.com/2012/hackyou-ctf-ppc100-hugecaptcha/

## Run Dockerized

Simple...

```bash
docker build -t antihuman .
docker run -tid -p 3000:3000 antihuman

# To test
./local.sh
```

## Run Locally

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
