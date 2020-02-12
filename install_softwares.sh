# Vundle
# https://github.com/VundleVim/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# fzf
# https://github.com/junegunn/fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# autojump
# https://github.com/wting/autojump
git clone git://github.com/wting/autojump.git ~/installed_software/autojump
pushd ~/installed_software/autojump
./install.py
popd
cat '[[ -s /home/dionisius/.autojump/etc/profile.d/autojump.sh ]] && source /home/dionisius/.autojump/etc/profile.d/autojump.sh' >> ~/.bashrc

# fd

# exa
# https://github.com/ogham/exa
# TODO: Install it from the source/latest version
sudo apt install exa

# docker command completion for bash
# https://docs.docker.com/compose/completion/
sudo curl -L https://raw.githubusercontent.com/docker/compose/1.25.3/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
