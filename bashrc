SCRIPT_PATH="${BASH_SOURCE[0]}";
if([ -h "${SCRIPT_PATH}" ]) then
  while([ -h "${SCRIPT_PATH}" ]) do SCRIPT_PATH=`readlink "${SCRIPT_PATH}"`; done
fi
pushd . > /dev/null
cd `dirname ${SCRIPT_PATH}` > /dev/null
SCRIPT_PATH=`pwd`;
popd  > /dev/null

# Only run when not interactive
if [ -z "$PS1" ]; then

# http://stackoverflow.com/questions/1198378/ssh-command-execution-doesnt-consider-bashrc-bash-login-ssh-rc
shopt -s expand_aliases

if [ -f ${SCRIPT_PATH}/aliases ]; then
    source ${SCRIPT_PATH}/aliases
fi

fi
