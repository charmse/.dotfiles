#!/bin/bash

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
if [ -d "$HOME/.oh-my-zsh/themes" ]; then
    cp .oh-my-zsh/themes/* "$HOME/.oh-my-zsh/themes/"
fi

# Home
cp .zshrc "$HOME/.zshrc"
cp .vimrc "$HOME/.vimrc"
cp -r .tmux "$HOME/.tmux"

# .config settings
cp -r ./nvim/ "$HOME/.config/nvim/" 
cp -r ./tmux/ "$HOME/.config/tmux/"
# Mac .configs
if [[ "$OSTYPE" == "darwin"* ]]; then
    cp -r ./kitty/ "$HOME/.config/kitty/" 
    cp -r ./sketchybar/ "$HOME/.config/sketchybar/" 
    cp -r ./skhd/ "$HOME/.config/skhd/"
    cp -r ./karabiner/ "$HOME/.config/karabiner/"
fi

