sudo apt install -y \
  lsd \
  build-essential \
  pinentry-tty \
  xdotool \
  xclip \
  git \
  tldr \
  zsh \
  vim \
  tree \
  tmux \
  httpie \
  python3-pip \
  rofi \
  htop \
  curl \
  stow \
  sxhkd \
  tig \
  bat \
  ripgrep \
  neofetch \
  shutter \
  fd-find \
  sxiv

# Tiling window manager deps
sudo apt install -y \
  bspwm polybar suckless-tools lxappearance picom xwallpaper dunst redshift \
  blueman

sudo snap install --classic code
sudo snap install postman
sudo snap install btop
sudo snap install gh

if ! nvim --version >/dev/null 2>&1; then
  sudo snap install nvim --classic
fi

if [ ! -d ~/tdrop ]; then
  sudo apt install -y gawk
  git clone https://github.com/noctuid/tdrop ~/tdrop
  (cd ~/tdrop && sudo make install)
fi

# Unimatrix
pip install git+https://github.com/will8211/unimatrix.git && \
  sudo mv ~/.local/bin/unimatrix /usr/local/bin

if [ ! -d ~/sent ]; then
  sudo apt install -y farbfeld libxft2-dev
  git clone https://git.suckless.org/sent ~/sent
  (cd ~/sent && make && sudo mv sent /usr/local/bin)
fi

#! heroku -v >/dev/null 2>&1 && \
#  curl https://cli-assets.heroku.com/install-ubuntu.sh | sh

# fonts
sudo apt-get install fonts-powerline
# font copied from:
# https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf
sudo cp ~/.after-install/DroidSansMonoForPowerlinePlusNerdFileTypesMono.otf /usr/share/fonts/

# rbenv
if [ ! -d ~/.rbenv ]; then
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv && \
    $(cd ~/.rbenv && src/configure && make -C src)
  # https://github.com/rbenv/ruby-build#readme
fi

source ~/.after-install/common.sh
