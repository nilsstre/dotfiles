# remove annoying welcome message
set fish_greeting ""

# use neovim instead of vim
alias vim nvim
alias svim 'sudo vim'
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

function ...
	cd ../.. $argv;
end

function ....
	cd ../../.. $argv;
end

# saving my ass
alias cp 'cp -i'
alias mv 'mv -i'
alias ln 'ln -i'

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
if test -e ~/.iterm2_shell_integration.fish
	source ~/.iterm2_shell_integration.fish
else
	curl -L https://iterm2.com/shell_integration/fish -o ~/.iterm2_shell_integration.fish
	source ~/.iterm2_shell_integration.fish
end

alias mkdir 'mkdir -v'
alias mounted 'mount | column -t'
alias diff 'colordiff'
alias path 'echo -e {$PATH//:/\\n}'
alias now 'date +"%T"'
alias nowtime now
alias nowdate 'date +"%d-%m-%Y"'
alias ports 'netstat -anvp tcp | awk \'NR<3 || /LISTEN/\''
alias header 'curl -I'

alias reboot 'sudo /sbin/reboot'
alias poweroff 'sudo /sbin/poweroff'
alias halt 'sudo /sbin/halt'
alias shutdown 'sudo /sbin/shutdown'
alias c clear

source ~/.config/fish/functions/event_handlers/*

direnv hook fish | source
