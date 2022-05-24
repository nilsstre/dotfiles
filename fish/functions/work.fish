function work
  set work_folder ~/work

  ls $work_folder | fzf | read -l result; and code ~/github/klarna/$result
end