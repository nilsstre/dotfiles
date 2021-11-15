set -x GREP_OPTIONS '--color=auto'
set -x GREP_COLOR '1;30;40'


# Event handler functions needs to be source directly in the config file to work
for func in (find ~/.config/fish/functions -name 'event_*.fish')
    source $func
end

# Add work scripts to path
set tools_bin ~/work/tools/bin

if test -d $tools_bin
    set PATH $tools_bin $PATH
end

# Operating system specific configuration
switch (uname)
    case Darwin
        set iterm2_integration_file ~/.iterm2_shell_integration.fish
    
        if not test -e $iterm2_integration_file # iTerm2 shell integration
            curl -L https://iterm2.com/shell_integration/fish -o $iterm2_integration_file
        end

        source $iterm2_integration_file
    case Linux
    
    case '*'
        echo WARNING! Unknown operating system!
end

if test -q $thefuck
    thefuck --alias | source
end

if test -q $direnv
    direnv hook fish | source
end

if test -q $navi
    navi widget fish | source
end
