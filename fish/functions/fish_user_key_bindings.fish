function fish_user_key_bindings --description "ctrl-p searches files with fzf and opens in vim"
	# Use ripgrep for fzf by default
	set -xg FZF_DEFAULT_COMMAND 'rg --files --follow -g "!{.git,node_modules,.DS_Store,Library,Applications,.npm,.zsh_sessions,.fzf,.cache,.vscode,work,klarna,nvm}/*" 2> /dev/null'

	bind \cp 'fzf | read -l result; and vim $result';
	bind \cw 'work'

	fzf_key_bindings
end