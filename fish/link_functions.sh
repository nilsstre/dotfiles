#!/usr/bin/env bash

# Should replace all ls with find
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

function_dir=~/.config/fish/functions

echo "Linking fish functions"
for func in $(ls -d $script_dir/functions/*.fish)
do
  file_name="$(basename $func)"

  ln -isv "$(echo $func)" "$(echo $function_dir)/$(echo $file_name)"
done

echo "Linking fish event handlers"
for func in $(ls -d $script_dir/functions/event_handlers/*.fish)
do
  file_name="$(basename $func)"

  ln -isv "$(echo $func)" "$(echo $function_dir)/$(echo $file_name)"
done

if [[ -d $script_dir/functions/work ]]
echo "Linking work fish functions"
then

  for func in $(ls -d $script_dir/functions/work/*.fish)
  do
    file_name="$(basename $func)"

    ln -isv "$(echo $func)" "$(echo $function_dir)/$(echo $file_name)"
  done
fi