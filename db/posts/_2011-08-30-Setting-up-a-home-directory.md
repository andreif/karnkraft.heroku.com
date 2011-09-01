http://thelucid.com/2008/12/02/git-setting-up-a-remote-repository-and-doing-an-initial-push/
http://joemaller.com/908/how-to-install-git-on-a-shared-host/


## .bashrc

alias up="source $HOME/.bashrc"
alias pu="vim $HOME/.bashrc"

export CLICOLOR=0
export LSCOLORS=ExFxCxDxBxegedabagacad
export PS1="\W $ "
export HISTCONTROL=ignoredups:erasedups

export LS_OPTIONS='--color=auto'
eval `dircolors`
alias ls='ls $LS_OPTIONS'
alias l='ls -lart $LS_OPTIONS'


## Installing git

echo "export PATH=$HOME/opt/bin:$PATH" >> ~/.bashrc
source ~/.bashrc

cd
mkdir src
cd src

curl -LO http://kernel.org/pub/software/scm/git/git-1.7.6.1.tar.bz2
tar -xjvf git-1.7.6.1.tar.bz2
cd git-1.7.6.1

./configure --prefix=$HOME/opt
make && make install

bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
