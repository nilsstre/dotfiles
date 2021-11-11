function hidefiles --description 'Hide hidden files in Finder'
  if test (uname) = 'Darwin'
    defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app
  else
    echo This command only works on macOS
    return 1
  end
end