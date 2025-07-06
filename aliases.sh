# tailscale
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

# Git
alias g=git

# Makes a dir and cd into it
mk_function() {
  if [ $1 ]
  then
    mkdir $1
    cd $1
  fi
}

alias mk=mk_function

# Git clone then cd
clone_function() {
  if [ $1 ]
  then
    full=$1
    if [ $2 ]
    then
      reponame=$2
    else
      with_dot_git="${full##*/}"
      reponame="${with_dot_git%.*}"
    fi

    git clone $full $reponame
    cd $reponame
  fi
}

alias clone=clone_function

clean_history_function() {
    sed -i '' '/FlyV1 fm2/d' $HISTFILE
    fc -R
}

alias clean_history=clean_history_function

debug_flapps_function() {
    tmuxinator start flapp -n $1 workspace=$(mktemp -d) app_name="$1"
}
alias debug_flapps=debug_flapps_function
