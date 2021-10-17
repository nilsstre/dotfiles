# Defined in - @ line 1
function sshServer --description 'SSH into home server'
	ssh -i ~/.ssh/$HOME_SERVER_KEY -p $HOME_SERVER_PORT $HOME_SERVER_USER@$HOME_SERVER_ADDRESS $argv;
end
