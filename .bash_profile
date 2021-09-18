
# silence warning about new default of zsh
export BASH_SILENCE_DEPRECATION_WARNING=1

# use anaconda for python env
# export PATH="/usr/local/anaconda3/bin:$PATH"  # commented out by conda initialize

# openssl for psycopg2
# https://stackoverflow.com/questions/11365619/psycopg2-installation-error-library-not-loaded-libssl-dylib
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/

# update path for Make > 3.8.1
# gnubin path since make was installed as "gmake"
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# this might be for Rust?
source "$HOME/.cargo/env"

source ~/.bashrc

