SCRIPT_PATH="${BASH_SOURCE[0]}";
if([ -h "${SCRIPT_PATH}" ]) then
  while([ -h "${SCRIPT_PATH}" ]) do SCRIPT_PATH=`readlink "${SCRIPT_PATH}"`; done
fi
pushd . > /dev/null
cd `dirname ${SCRIPT_PATH}`/../ > /dev/null
SCRIPT_PATH=`pwd`;
popd  > /dev/null

echo "Syncing dotfiles from ${SCRIPT_PATH}"
echo ""

if [ $1 ] ; then
    if ssh $@ "which git"; then
        echo "Updating via Git..."
        ssh $@ "cd ~/.dotfiles && git pull;"
        
    else
        echo "Updating via rsync..."
        rsync -arvzc --delete --exclude=.* ${SCRIPT_PATH}/. $@:~/.dotfiles
        
    fi
    ssh $@ "~/.dotfiles/install.sh;"
else
    echo "'$1' is not a valid server! Usage: ./sync-dotfiles.sh user@hostname"
fi