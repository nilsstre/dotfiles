function fish_user_key_bindings --description "ctrl-p searches files with fzf and opens in vim"
	# Use ripgrep for fzf by default
	set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow -g "!{.git,node_modules,.DS_Store,Library,Applications,.npm,.zsh_sessions,.fzf,.cache}/*" 2> /dev/null'

	bind \cp 'fzf | read -l result; and vim $result';
	fzf_key_bindings
end