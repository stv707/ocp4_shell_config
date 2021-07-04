# ocp4 shell config
***
> Make your life easier with setting shell prompt to show OCP user and project/ns 

* Steps:

1. cd to your home dir 
```
[user@ocp4 ~]$ cd ~
``` 

2. git clone this repo
```
[user@ocp4 ~]$  git clone https://github.com/stv707/ocp4_shell_config.git
```

3. copy .oc-prompt to your home dir 
```
[user@ocp4 ~]$  cp ocp4_shell_config/.oc-prompt.sh  ~/
```

4. edit .bashrc and add the below line 
```
[user@ocp4 ~]$ vim ~/.bashrc


NORMAL="\[\033[00m\]"
BLUE="\[\033[01;34m\]"
YELLOW="\[\e[1;33m\]"
GREEN="\[\e[1;32m\]"

export PS1="${BLUE}\W ${GREEN}\u${YELLOW}\$(__oc_user)${GREEN}\$(__oc_ps1)${NORMAL}\$ "
source ~/.oc-prompt.sh
```
5. Exit and relogin
```
[user@ocp4 ~]$ exit 
```
>> beyond this, whenever you login to ocp , your ocp username and project/namespace will be displayed on prompt and NULL will be displayed if you are not logged into ocp 

6. Preview ( after login )
```
~ user(ocu:NOTLOGGEDIN)(ocp:NOTLOGGEDIN)$ 

~ user(ocu:NOTLOGGEDIN)(ocp:NOTLOGGEDIN)$ oc login -u rastaman -p somepassword 
Login successful.

You have access to 63 projects, the list has been suppressed. You can list all projects with 'oc projects'

Using project "default

~ steve(ocu:rastaman)(ocp:default)$ oc project someproject
Now using project "someproject" on server "https://api.ocp4.example.com:6443".

~ steve(ocu:rastaman)(ocp:someproject$
```



