# auto-health 

**noobs system audit/fix ?**

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



clone the repo 
cd into the repo

```bash
sudo make install
```
you can run specific functinos too 
```bash
troubleshooter --dns --network
```

