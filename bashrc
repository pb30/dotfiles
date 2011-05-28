# Only run when not interactive
if [ -z "$PS1" ]; then

# http://stackoverflow.com/questions/1198378/ssh-command-execution-doesnt-consider-bashrc-bash-login-ssh-rc
shopt -s expand_aliases

source ~/.bash_profile

fi