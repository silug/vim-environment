#!/bin/bash
#
# Create symlinks to this directory for vim and neovim

set -e

link() {
    src=$1
    tgt=$2

    if [ -L "$tgt" -a "$( readlink "$tgt" )" = "$src" ] ; then
        return
    fi

    if [ ! -e "$tgt" ] ; then
        ln -sfv "$src" "$tgt"
    elif [ -L "$tgt" ] ; then
        rm -fv "$tgt"
        ln -sfv "$src" "$tgt"
    else
        echo "Skipping existing directory $tgt"
    fi
}

reldir="$( dirname "$0" )"

if [ -z "$dir" ] ; then
    reldir='.'
fi

dir="$( realpath "$reldir" )"

# Configure vim
link "$dir"/.vimrc ~/.vimrc
link "$dir"/.gvimrc ~/.gvimrc

# Configure neovim
mkdir -pv ~/.config ~/.local/share/nvim

for target in ~/.config/nvim ~/.local/share/nvim/site ; do
    link "$dir" "$target"
done
