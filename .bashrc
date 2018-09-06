# .bashrc

# User specific aliases and functions


PATH=$PATH:$HOME/.local/bin:$HOME/bin
PATH=$PATH:ANDROID_HOME/platform-tools
PATH=$PATH:ANDROID_HOME/tools
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_NDK_ROOT=$HOME/Android/Sdk/ndk-bundle
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

alias vi="nvim"
alias v="nvim"
export EDITOR=nvim
alias yt="youtube-dl"
alias yta="youtube-dl-a"
alias ytx="youtube-dl-x"
alias zd="zeed"
alias za="zeeda"
alias zx="zeedx"

alias ytr="vi ~/bin/media2dl.list"
alias vn="vnstat -h -i wlp2s0"
alias vnn="vnstat -h -i enp3s0"
alias vnw="watch -n 60 vnstat -h -i wlp2s0"
alias vnnw="watch -n 60 vnstat -h -i enp3s0"
alias vnaw="watch -n 60 vnstat"
alias vna="vnstat"

alias godot-git="cd ~/Documents/applikations/godot-git/ ; ./bin/godot.x11.tools.64* ; cd ~"
alias godot-git-rebase="cd ~/Documents/applikations/godot-git/ ; git pull --rebase upstream master | grep -q -v 'Already up-to-date.' && scons platform=x11 -j 5 use_llvm=yes; ./bin/godot.x11.tools.64* ; cd ~"
alias godot-git-rebase-clean="cd ~/Documents/applikations/godot-git/ ; git clean -d -x -q -f ; git pull --rebase upstream master ; scons --config=force platform=x11 -j 5 use_llvm=yes; ./bin/godot.x11.tools.64* ; cd ~"


alias tiled-git="cd ~/Documents/applikations/tiled-git/build/ ; ./bin/tiled ; cd ~"
alias tiled-git-rebase="cd ~/Documents/applikations/tiled-git/ ;  git pull --rebase upstream master ; cd build ; qmake ../tiled.pro ; make -j 5 ; ./bin/tiled ; cd ~"
alias tiled-git-rebase-clean="cd ~/Documents/applikations/tiled-git/ ; git clean -d -x -q -f ; git pull --rebase upstream master ;  cd build ; qmake ../tiled.pro make -j 5 ; ./bin/tiled ; cd ~"

#builtin_openssl=yes
# Sourcee global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

n () { # open a note in the specified sub-directory of notes, or creates it
	[ ! -d $HOME/Documents/notes ] && mkdir -p $HOME/Documents/notes
	${EDITOR:-nvim} $HOME/Documents/notes/"$*"*
} 


ff(){ # searches all files for a string and returns the full info about the results
	grep -insr "$*" $HOME/Documents/notes/ --exclude-dir=".git" |  sed -e "s/^.*notes//" | grep -ins "$*"
}

f(){ # searches all files for a string and returns the name of the files that have it
	grep -linsr "$*" $HOME/Documents/notes/ --exclude-dir=".git" | sed -e "s/^.*notes//" 
}


fls() { #search the notes directory for files with a given name
	find $HOME/Documents/notes -name "$*"
}

alias dot='PATH="$HOME/.config/dotgit/bin:$PATH" git --git-dir="$HOME/.config/dotgit/repo" --work-tree="$HOME"'
