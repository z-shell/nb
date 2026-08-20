#!/usr/bin/env zsh
# -*- mode: zsh; sh-indentation: 2; indent-tabs-mode: nil; sh-basic-offset: 2; -*-
# vim: ft=zsh sw=2 ts=2 et
#
# https://wiki.zshell.dev/community/zsh_plugin_standard#zero-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# https://wiki.zshell.dev/community/zsh_plugin_standard#standard-plugins-hash
typeset -gA Plugins
Plugins[NB_DIR]="${0:h}"

# --- nb XDG Base Directory defaults -----------------------------------------
# Documented global effect: export NBRC_PATH, NB_DIR, and NB_HIST with XDG
# Base Directory defaults. See lib/xdg-defaults.zsh for what it does and why.
#
# NOTE: Zi's `as'program'`/`as'completion'` install modes -- the ones this
# plugin documents and package.json's zi-ices recommend -- never source this
# file, so the `atinit` ice in package.json and docs/README.md sources
# lib/xdg-defaults.zsh directly instead.
source "${0:h}/lib/xdg-defaults.zsh"
# --- end nb XDG Base Directory defaults -------------------------------------

# https://wiki.zshell.dev/community/zsh_plugin_standard#funtions-directory
if [[ $PMSPEC != *f* ]]; then
  fpath+=( "${0:h}/functions" )
fi

# https://wiki.zshell.dev/community/zsh_plugin_standard#binaries-directory
if [[ $PMSPEC != *b* ]]; then
  path+=( "${0:h}/bin" )
fi
