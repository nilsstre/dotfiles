# remove annoying welcome message
set fish_greeting ""

# use neovim instead of vim
alias vim nvim
alias view 'nvim -R'
alias vimdiff 'nvim -d'

# ctrl-p searches files with fzf and opens in vim
function fish_user_key_bindings
	bind \cp 'fzf | read -l result; and vim $result';
	fzf_key_bindings
end

# Use ripgrep for fzf by default
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'

# fasd without args uses fzf
function z
	set -l dir (fasd -Rdl $argv[1] | fzf -1 -0 --no-sort +m); and cd $dir; return 1
end

# kill ports easily
function killport
	if set -q argv[1]
		kill -9 (lsof -t -i:$argv[1])
	end
end

function ...
	cd ../.. $argv;
end

function ....
	cd ../../.. $argv;
end

# saving my ass
alias cp='cp -i'
alias mv='mv -i'

# thefuck
thefuck --alias | source

# nicer grep
alias grep='grep --color=auto'

# easily show and hide hidden files in Finder
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# edit vimrc easily
alias vimconf='vim ~/.vim/vimrc'

# iTerm2 shell integration
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# Load nvm functions
load_nvm