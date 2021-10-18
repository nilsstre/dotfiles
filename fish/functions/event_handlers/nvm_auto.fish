function nvm_auto --on-variable PWD --description 'Do rvm stuff'
  status --is-command-substitution; and return

  if test -e .nvmrc
    nvm use (cat .nvmrc)
    echo Using node version: (node -v)
    end
end
