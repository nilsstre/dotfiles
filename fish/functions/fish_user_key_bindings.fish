function fish_user_key_bindings --description "ctrl-p searches files with fzf and opens in vim"
  # See FZF_DEFAULT_COMMAND env variable for ignore files/folders
	bind \cp 'fzf | read -l result; and vim $result';
	fzf_key_bindings
end