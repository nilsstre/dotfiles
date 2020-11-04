# Defined in - @ line 1
function sshDesktop --description 'SSH into home desktop'
	ssh -i ~/.ssh/$HOME_DESKTOP_KEY -p $HOME_DESKTOP_PORT $HOME_DESKTOP_USER@$HOME_DESKTOP_ADDRESS $argv;
end
