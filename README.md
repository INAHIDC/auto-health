# auto-health 

**shell help for help Desk 🙃 some system diagnostics**

## files

- DNS Check
- Driver Updates Check
- Storage Check
- SMART Stat Check
- Network Check
- Service Check
- Sys Load Check
- Logging w/ Timestamps
- Config 

next: i think after i finish this, since now i have a good understanding of what im doing; im going to implement something like lynis to audit and then based on the audit automate some scripts to harden system. 

 to run the shootah

```bash
git clone https://github.com/INAHIDC/auto-health.git

cd troubleshooter

sudo make install

```

if you want to run specific file 
```bash

troubleshooter --dns --network

```
if you want to change anything 

```
sudo nano config/troubleshooter.conf

```
