#!/bin/bash

###########################################################################
#                             Load .dotfiles
###########################################################################
DOTFILES_REPO="$(dirname "$(readlink "${HOME}/.dotfiles/.dotfiles-config")")"
source ${DOTFILES_REPO}/config.sh
reload_dot_files
###########################################################################