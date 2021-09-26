# just $ sign
# export PS1="$ "

# default
# export PS1="\w\$ "

# add working directory and git branch
# https://medium.com/@thucnc/how-to-show-current-git-branch-with-colors-in-bash-prompt-380d05a24745
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# standard settings from Medium article above
# export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

# export PS1="\[\e[37m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\] $ "

# added by travis gem
[ ! -s /Users/brianrice/.travis/travis.sh ] || source /Users/brianrice/.travis/travis.sh
source "$HOME/.cargo/env"

# for rbenv (ruby); used for Travis CI
eval "$(rbenv init -)"

# silence warning about new default of zsh
export BASH_SILENCE_DEPRECATION_WARNING=1


# Misc --------------------------------------------------------------------------------------------

source ~/dev/dotfiles/.aliases

# colorful `ls` output
# https://www.cyberciti.biz/faq/apple-mac-osx-terminal-color-ls-output-option/
export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad

# change pip to point to pip3
alias pip=pip3

# load AWS/MySQL DB variables
# source ~/.mysqlconfig


# Git ---------------------------------------------------------------------------------------------

# add working directory and git branch
# https://medium.com/@thucnc/how-to-show-current-git-branch-with-colors-in-bash-prompt-380d05a24745
# "2>"" redirects stderr (file descriptor 1 is stdout)
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# color guide: https://misc.flogisoft.com/bash/tip_colors_and_formatting
# \u@\h             user @ device       96 light cyan
# \w                working directory   37 light gray
# parse_git_branch  git branch          91 light red
export PS1="\[\e[96m\]\u: \[\e[37m\]\w\[\e[91m\]\$(parse_git_branch) \[\e[00m\]$ "

