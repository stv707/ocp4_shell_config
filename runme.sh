#!/bin/bash 
# Func

function errorme()
{

echo "Seems you already exec this"
echo "Clean up before re-exec"
echo "Clean 1 : remove ~/.oc-prompt.sh"
echo "Clean 2 : remove line OCP START to OCP END in ~/.bashrc"
exit 22 

}

function add_bashrc()
{ 
cat <<EOF
#### OCP START #####
NORMAL="\[\033[00m\]"
BLUE="\[\033[01;34m\]"
YELLOW="\[\e[1;33m\]"
GREEN="\[\e[1;32m\]"

export PS1="${BLUE}\W ${GREEN}\u${YELLOW}\$(__oc_user)${GREEN}\$(__oc_ps1)${NORMAL} \$ "
source ~/.oc-prompt.sh
#### OCP END ####
EOF 
} 

## Main 

if -f ~/.oc_prompt.sh 
then 
errorme 
else 
cp .oc_prompt.sh ~/

grep OCP ~/.bashrc &> /dev/null 
    if [ $? -eq 0 ]
    then 
    add_bashrc >> ~/.bashrc
    else 
    errorme 
    fi 
fi 