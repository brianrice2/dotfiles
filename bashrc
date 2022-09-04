# added by travis gem
[ ! -s /Users/brianrice/.travis/travis.sh ] || source /Users/brianrice/.travis/travis.sh
source "$HOME/.cargo/env"

# for rbenv (ruby); used for Travis CI
eval "$(rbenv init -)"


# Misc --------------------------------------------------------------------------------------------

# colorful `ls` output
# https://www.cyberciti.biz/faq/apple-mac-osx-terminal-color-ls-output-option/
export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad


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

