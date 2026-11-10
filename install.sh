#!/usr/bin/env zsh
#
# This installation is destructive, as it removes existing files/directories.
# Use at your own risk.
#
# Taken from: https://github.com/mitchellh/dotfiles

# Resolve the directory containing this script using zsh's native modifiers.
SCRIPT_DIR=${0:A:h}

# names in this list won't be dot-prefixed
skip_dot_prefix=(nvim)

# Check whether the first argument appears in the remaining arguments.
contains() {
  local match="$1"
  shift
  local e
  for e in "$@"; do
    [[ "$e" == "$match" ]] && return 0
  done
  return 1
}

# copy or symlink all the dotfiles
UNAME=$(uname | tr '[:upper:]' '[:lower:]')
for source_path in "$SCRIPT_DIR"/*(N); do
  name=${source_path:t}
  case $name in
    *.md|*.sh) continue;;
  esac

  # If there exists a platform-specific version, then use that
  if [[ -e "${source_path}.${UNAME}" ]]; then
    echo "Using platform-specific ${name} for ${UNAME}"
    source_path="${source_path}.${UNAME}"
  fi

  # If the file is in the skip dot list, then we don't add a dot
  target="$name"
  if ! contains "$name" "${skip_dot_prefix[@]}"; then
    target=".$name"
  fi

  # Build our complete source_path to the home directory
  target="$HOME/$target"
  if [[ -h "$target" || -f "$target" ]]; then
    rm "$target"
  elif [[ -d "$target" ]]; then
    rm -rf "$target"
  fi

  case $UNAME in
    cygwin* | mingw32*)
      cp -R "$source_path" "$target"
      echo "Copied $name to $target."
      ;;
    *)
      ln -s "$source_path" "$target"
      echo "Linked $name to $target."
      ;;
  esac
done

# setup the vim directory
pushd "$HOME" >/dev/null
if [[ ! -d ".vim/bundle" ]]; then
    echo "Installing Vim plugins"
    mkdir -p .vim .vim/bundle .vim/backup .vim/swap .vim/cache .vim/undo
    curl -fLo .vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    TERM=dumb vim +PlugInstall +qall >vim.log 2>&1
fi
popd >/dev/null
