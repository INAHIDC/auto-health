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


## to run the shootah

```bash
git clone https://github.com/INAHIDC/auto-health.git

cd troubleshooter

sudo make install

```

## if you want to run specific file 
```bash

troubleshooter --dns --network

```
## if you want to change anything 

```
sudo nano config/troubleshooter.conf

```