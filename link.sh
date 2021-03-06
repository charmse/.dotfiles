#!/usr/bin/env bash

RED=`tput setaf 1`
GREEN=`tput setaf 2`
RESET=`tput sgr0`

custom_link() {
  file_loc="$1"
  symlink_loc="$2"

  # Check whether original file is valid
  if [[ ! -e "$file_loc" ]]; then
    echo "${RED}WARNING${RESET}: Failed to link $symlink_loc to $file_loc"
    echo "         $file_loc does not exist"
    return 1
  fi

  # Check whether symlink already exists
  if [[ -e "$symlink_loc" ]]; then
    if [[ -L "$symlink_loc" ]]; then
      if [[ "$(readlink $symlink_loc)" == "$file_loc" ]]; then echo "--> $symlink_loc -> $file_loc ${GREEN}exists${RESET}."; return 0; fi

      current_dest=$(readlink "$symlink_loc")
      echo "It seems like $symlink_loc already is symlink to $current_dest."
      read -p "Do you want to replace it? [Y/N] " -n 1 -r
      if [[ $REPLY =~ ^[Yy]$ ]]
      then
        echo
        echo "Removing current symlink..."
        unlink  $symlink_loc
        ln -s "$file_loc" "$symlink_loc"
        echo "Created a symlink $symlink_loc -> $file_loc"
        return 0
      fi
      echo
      return 2
    else
      echo "It seems like $symlink_loc already exists."
      read -p "Do you want to [d]elete, [m]ove (-> $HOME/.other/) or [k]eep $symlink_loc? " -n 1 -r
      if [[ $REPLY =~ ^[Dd]$ ]]
      then
        printf "\nDeleting $symlink_loc..."
        rm -rf "$symlink_loc"
        ln -s "$file_loc" "$symlink_loc"
        echo "Created a symlink $symlink_loc -> $file_loc"
        return 0
      elif [[ $REPLY =~ ^[Mm]$ ]]; then
        printf "\nMoving $symlink_loc to ~$HOME/.other..."
        mkdir "$HOME/.other"
        mv "$symlink_loc" "$HOME/.other"
        ln -s "$file_loc" "$symlink_loc"
        echo "Created a symlink $symlink_loc -> $file_loc"
        return 0
      else
        printf "\nKeeping $symlink_loc...\n"
        return 2
      fi
    fi
  fi

  symlink_dir=$(dirname "$symlink_loc")
  if ! mkdir -p "$symlink_dir" ; then
   echo "${RED}WARNING${RESET}: Failed to link $symlink_loc to $file_loc"
   echo "         Could not create folder $symlink_dir/"
   return 1
  fi

  ln -s "$file_loc" "$symlink_loc"
  echo "Created a symlink $symlink_loc -> $file_loc"
  return 0
}

custom_link "$HOME/.dotfiles/.zsh_profile" "$HOME/.zsh_profile"
custom_link "$HOME/.dotfiles/.zshrc" "$HOME/.zshrc"
custom_link "$HOME/.dotfiles/init.vim" "$HOME/.config/nvim/init.vim"
custom_link "$HOME/.dotfiles/.tmux.conf" "$HOME/.tmux.conf"
custom_link "$HOME/.dotfiles/.gitconfig" "$HOME/.gitconfig"
custom_link "$HOME/.dotfiles/init.el" "$HOME/.emacs.d/init.el"
