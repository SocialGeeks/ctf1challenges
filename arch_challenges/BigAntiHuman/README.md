# Big Anti-Human Captcha - Robot Liberation

This is a __simple__ time sensitive math question using large values. The user has 500 miliseconds to send the correct answer to random addition questions. The ideas was lifted in almost its entirety from the 2013 HackYou CTF PPC100 challenge.  http://www.hacksonville.com/2012/hackyou-ctf-ppc100-hugecaptcha/

## Run Dockerized

Simple...

```bash
docker build -t bigantihuman .
docker run -tid -p 3000:3000 bigantihuman

# To test
./local.sh
```

## Run Locally

### System Packages
* Nodejs  

### Install with node package manager.  

	npm install 

### Systemd  
	useradd -d /home/ctfuser -m -s /sbin/nologin ctfuser  
	cp systemd/bigantihuman.service /usr/lib/systemd/system/  
	systemctl enable bigantihuman.service  
	systemctl start bigantihuman  

## Other files

local.sh is a example on how to solve the challenge.  
