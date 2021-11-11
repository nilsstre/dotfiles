function gpg-export-public --argument $email
  
  if test -z $email
      echo No email specified
      return 1
  end

  gpg --armor --export $email
end