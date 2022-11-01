#!/usr/bin/env zsh
# -*- mode: zsh; sh-indentation: 2; indent-tabs-mode: nil; sh-basic-offset: 2; -*-
# vim: ft=zsh sw=2 ts=2 et
#
# Zsh Plugin Standard
# https://wiki.zshell.dev/community/zsh_plugin_standard#zero-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# https://wiki.zshell.dev/community/zsh_plugin_standard#standard-plugins-hash
typeset -gA Plugins
Plugins[NB_DIR]="${0:h}"

# https://wiki.zshell.dev/community/zsh_plugin_standard#funtions-directory
if [[ $PMSPEC != *f* ]]; then
  fpath+=( "${0:h}/functions" )
fi

nb() {
  local bindir="${Plugins[NB_DIR]}/bin"
  "$bindir"/"nb" "$@"
}

nb "$@"

#NB_NOTEBOOK_PATH=
#BROWSER=
#EDITOR=
#PAGER=
#NB_AUTO_SYNC=1
#NB_DIR=
#NB_DEFAULT_EXTENSION=md
#NB_ENCRYPTION_TOOL=gpg
#NB_COLOR_PRIMARY=46
#NB_COLOR_SECONDARY=8
#NB_COLOR_THEME=console
#NB_FOOTER=1
#NB_HEADER=1
#NB_LIMIT=15
#NB_SYNTAX_THEME=ansi-dark
#NBRC_PATH=
