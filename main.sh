sudo apt install -y \
  pinentry-tty \
  xdotool \
  xclip \
  git \
  zsh \
  vim \
  tmux \
  python3-pip \
  bat

! code --version >/dev/null 2>&1 && \
  sudo snap install --classic code

[ ! -d ~/snap/postman ] && \
  sudo snap install postman

#! heroku -v >/dev/null 2>&1 && \
#  curl https://cli-assets.heroku.com/install-ubuntu.sh | sh

####
# The following scripts may depend on previous ones
####

# oh-my-zsh
if [ ! -d ~/.oh-my-zsh/ ]; then
  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  sudo apt-get install fonts-powerline
  # if you fail password at setting zsh as default shell,
  # use `chsh -s $(which zsh)` to try again
fi

# nvm
if [ ! -s "$NVM_DIR/nvm.sh" ]; then
  export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
  ) && \. "$NVM_DIR/nvm.sh"
fi

# rbenv
if [ ! -d ~./rbenv ]; then
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv && \
    $(cd ~/.rbenv && src/configure && make -C src)
  # https://github.com/rbenv/ruby-build#readme
fi

## zsh configuration
if [ -f ~/.zshrc ]; then
  # oh my zsh
  sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc
  sed -i 's/plugins=(git)//g' ~/.zshrc

  # syntax highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
  echo "source ~/.zsh/zsh-autosuggestions/zsh-syntax-highlighting.zsh" >> ~/.zshrc

  # autosuggestions
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
  echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

  # zsh-spell-book
  git clone https://github.com/EdgardoArriagada/.zsh-spell-book ~/.zsh-spell-book
  echo "source ~/.zsh-spell-book/main.zsh" >> ~/.zshrc
fi
