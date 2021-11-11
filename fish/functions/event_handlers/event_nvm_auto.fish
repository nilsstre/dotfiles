function event_nvm_auto --on-variable PWD --description 'Auto switch node version based on .nvmrc file'
  status --is-command-substitution; and return

  if test -e .nvmrc
    nvm use (cat .nvmrc)
    echo Using node version: (node -v)
  end
end
