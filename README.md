# Sdev

## Prepare the sdev-docker

On the sdev-docker:


### Environment
Pre-requirements : 
- Choose a public ssh port

Create your .env file:
```
cd ~/sdev
vim .env
```

Example :
```
SDEV_SSH_PORT=13645
SSH_USER_PASSWD=hakunamatata
```

### Public ssh key
Put your public ssh key inside authorized_keys file

```
cd ~/sdev
vim authorized_keys
```

### Create Cerbo project volume folder
```
cd ~
mkdir dev-projects
```

### Create sdev aliases
```
vim ~/.bash_aliases
```
```
alias sdev_down='docker-compose --env-file ~/sdev/.env -f ~/sdev/docker-compose.yaml down'
alias sdev_up='docker-compose --env-file ~/sdev/.env -f ~/sdev/docker-compose.yaml up -d --build'
alias sdev_stop='docker stop sdev'
alias sdev_start='docker start sdev'
alias sdev_restart='docker restart sdev'
alias sdev_connect='docker exec -ti sdev bash'
```
```
source ~/.bash_aliases
```

## Start your sdev-cerbo

### Launch sdev container

On the localhost:
```
sdev_up
```

### Config SSH
On my localhost:

```
vim ~/.ssh/config
```

Example :
```
Host sdev
  HostName localhost
  Port 13645
  User sshuser
  IdentityFile /Users/myuser/.ssh/id_rsa
```