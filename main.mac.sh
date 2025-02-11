cask_apps=(
  ghostty
  font-hack-nerd-font
  flameshot
  postman
)

brew_apps=(
  asdf
  tmuxp
  docker
  docker-compose
  colima
  stow
  prettierd
  gopls
  stylua
  lsd
  tmux
  hammerspoon
  bat
  tig
  neovim
  ripgrep
  sd
  nvm
  gnupg2
  gh
  pinentry-mac
  fd
  tldr
  git-delta
  sox
  coreutils
  fzf
  btop
  font-caskaydia-cove-nerd-font
  koekeishiya/formulae/skhd
  choose-gui
)

brew install --cask "${cask_apps[@]}"
brew install "${brew_apps[@]}"

skhd --start-service

# Unimatrix
pip install git+https://github.com/will8211/unimatrix.git && \
  sudo mv ~/Library/Python/3.8/bin/unimatrix /usr/local/bin

source ~/.after-install/common.sh
