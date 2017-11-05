#!/usr/bin/env bash

function dot_files {
  for file in home/.[^.]*; do
    ln --symbolic --verbose --force $(readlink -f $file) $HOME;
  done

  # Desktop entries for Gnome 3
  # https://developer.gnome.org/desktop-entry-spec/
  ln --symbolic --verbose --force $(readlink -f home/local/share/applications) $HOME/.local/share/applications
}

function hardware_dependent {
  HD_DIR="hardware-dependent/$1"
  if [ ! -d "$HD_DIR" ]; then
    echo "Nothing to do for hardware named '$1'."
    return
  fi
  pushd $HD_DIR
  ./install.sh
  popd
}

function install_personal_data {
  while true; do
    read -e -p "Please enter path from which to copy $1 (type '-' to skip): " path
    path=$(eval "echo $path")
    dest=$2

    if [ "$path" == "-" ]; then
      echo Not restoring data for $1.
      break
    fi

    if [ ! -e $path ]; then
      echo The path \'$path\' does not exist.
      continue
    fi

    if [ -e $dest ]; then
        while true; do
          read -p "WARNING: $dest exists. Replace it? [y/n]: " yn
          if [ "$yn" == "y" ]; then
            break
          fi
          if [ "$yn" == "n" ]; then
            echo Not restoring data for $1.
            return
          fi
          echo Please enter \'y\' or \'n\'.
        done
    fi

    echo Copying \'$path\' to $dest
    cp --recursive --no-target-directory $path $dest

    break
  done
}

function data_dirs {
  mkdir -p $HOME/audio
  mkdir -p $HOME/code
  mkdir -p $HOME/Documents
  mkdir -p $HOME/Videos
}

function mkdirlink {
  if [ -L $2 ]; then
    return
  fi

  ln --symbolic --no-target-directory $1 $2
}

function backup_source {
  mkdir -p $HOME/backup
  mkdirlink $HOME/audio $HOME/backup/audio
  mkdirlink $HOME/projects $HOME/backup/code
  mkdirlink $HOME/Documents $HOME/backup/documents
  mkdirlink $HOME/Videos $HOME/backup/video
  mkdir -p $HOME/backup/profile
  mkdirlink $HOME/keepass-db.kdbx $HOME/backup/profile/keepass-db.kdbx
  mkdirlink $HOME/.ssh $HOME/backup/profile/ssh
  mkdirlink $HOME/.reminders $HOME/backup/profile/reminders
  mkdirlink $HOME/.thunderbird/*.default/abook.mab $HOME/backup/profile/abook.mab
}

echo Installing dot files...
dot_files
echo Done installing dot files.

echo Creating data directories...
data_dirs
echo Done creating data directories.

echo Installing personal data from provided backup location...
install_personal_data '.ssh keys' ~/.ssh
install_personal_data 'KeePass password database' ~/keepass-db.kdbx
install_personal_data 'Address book' ~/.thunderbird/*.default/abook.mab
install_personal_data 'Reminder file' ~/.reminders
echo Done installing personal data.

echo Creating backup "source" directory...
backup_source
echo Done creating backup "source" directory.

echo Installing hardward-dependent configuration...
if [ -n "$1" ]; then
	hardware_dependent $1
	echo Done installing hardware-dependent configuration.
else
	echo 'Skipping installation (no hardware name specified).'
fi

echo Scheduling tasks...
cat home/.crontab | crontab
echo Done scheduling tasks
