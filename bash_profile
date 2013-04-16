SCRIPT_PATH="${BASH_SOURCE[0]}";
if([ -h "${SCRIPT_PATH}" ]) then
  while([ -h "${SCRIPT_PATH}" ]) do SCRIPT_PATH=`readlink "${SCRIPT_PATH}"`; done
fi
pushd . > /dev/null
cd `dirname ${SCRIPT_PATH}` > /dev/null
SCRIPT_PATH=`pwd`;
popd  > /dev/null

alias bashreload="${SCRIPT_PATH}/install.sh"
alias reloadbash="bashreload"
alias dotsync=${SCRIPT_PATH}/bin/sync-dotfiles.sh

###################### Bash settings
export EDITOR=nano
export PS1='\[\033[0;32m\]\u@\h\[\033[0;36m\]:\w\[\033[00m\]: '
export HISTCONTROL=ignoreboth
export HISTFILESIZE=5000
export HISTSIZE=5000

export ACK_OPTIONS="-i --sort-files --color --follow --group"

shopt -s checkwinsize    # check and update lines & cols after each cmd

# enable command and file completion after sudo
complete -f -c sudo

###################### Redefining default params
######## Color
if [ -x /usr/bin/dircolors ] ; then
   eval "`dircolors -b`"
   alias ls='ls -hF --color'
   export GREP_OPTIONS='--color=auto'
fi

######## Use some nicer colors
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

###################### Key control
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward
bind '"\M-w"':"\"\C-k\C-ahistory | grep '^ *[0-9]* *\C-e.'\C-m\""
bind Space:magic-space # `svn diff !:2` inserts 2nd arg from previous 
#bind '"\C-\t":menu-complete'

###################### Mac Settings
if [[ $OSTYPE == darwin1* ]]; then
   defaults write com.apple.desktopservices DSDontWriteNetworkStores true
   alias ls='ls -hFG'
   export GREP_OPTIONS='--color=auto'
fi

###################### Load external scripts
if [ -f ${SCRIPT_PATH}/aliases ]; then
    source ${SCRIPT_PATH}/aliases
fi

if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

if [ -f ${SCRIPT_PATH}/git-completion ] && which git &> /dev/null; then
    source ${SCRIPT_PATH}/git-completion
fi

if [ -f ${SCRIPT_PATH}/git-flow-completion ] && which git-flow &> /dev/null; then
    source ${SCRIPT_PATH}/git-flow-completion
fi

if [ -f ~/.localrc ]; then
    source ~/.localrc
fi

#source ${SCRIPT_PATH}/z.sh
source ${SCRIPT_PATH}/fasd/fasd
eval "$(fasd --init auto)"
alias v="fasd -e vim"

######################  PATH + Private bin
if [ -d ${SCRIPT_PATH}/bin ] ; then
    PATH="${SCRIPT_PATH}/bin:${SCRIPT_PATH}/bin/git-flow:$PATH"
fi
