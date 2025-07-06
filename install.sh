brew install starship fzf asdf fop openssl unixodbc openjdk wxmac tmux tmuxinator direnv libpq libsodium autoconf automake make gcc

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

if [ ! -d ~/.tmux/plugins/tpm ] ; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ] ; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search ] ; then
    git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
fi

asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git

mkdir -p ~/workspace/superfly
mkdir -p ~/scripts

touch ~/.zshrc

LINE_TO_ADD="source ~/dotfiles/.zshrc"
if ! grep -Fxq "$LINE_TO_ADD" ~/.zshrc; then
  echo "$LINE_TO_ADD" >> ~/.zshrc
fi

rm -f ~/.gitconfig
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/workspace/superfly/flyctl/bin/flyctl ~/scripts/flyctl-stage
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

asdf install erlang 28.0.1
asdf set -u erlang 28.0.1

asdf install elixir 1.18.4-otp-28
asdf set -u elixir 1.18.4-otp-28

asdf install nodejs 24.3.0
asdf set -u nodejs 24.3.0

asdf install golang 1.24.4
asdf set -u golang 1.24.4

asdf install ruby 3.4.4
asdf set -u ruby 3.4.4
