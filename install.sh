brew install starship fzf asdf fop openssl unixodbc openjdk wxmac

asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add golang https://github.com/asdf-community/asdf-golang.git

asdf install erlang 28.0.1
asdf global erlang 28.0.1

touch ~/.zshrc
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
echo 'source <(fzf --zsh)' >> ~/.zshrc

