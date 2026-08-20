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
# Base Directory defaults, but only when the user has not already set them
# AND the legacy $HOME path does not already exist. This keeps an existing
# ~/.nbrc or ~/.nb installation working unchanged while giving fresh installs
# XDG-compliant paths with no files written to $HOME. nb honors every other
# variable the same "${VAR:-default}" way already; see
# https://xwmx.github.io/nb/#-variables for the full list. This plugin only
# widens the *default* for the handful that otherwise fall back into $HOME.
#
# NOTE: Zi's `as'program'`/`as'completion'` install modes -- the ones this
# plugin documents and package.json's zi-ices recommend -- never source this
# file, so an equivalent copy of this logic also lives in the `atinit` ice in
# package.json and docs/README.md. Keep both in sync.
if [[ -z ${NBRC_PATH:-} && ! -e ${HOME}/.nbrc ]]; then
  export NBRC_PATH="${XDG_CONFIG_HOME:-${HOME}/.config}/nb/nbrc"
  # Upstream `nb init` writes NBRC_PATH with a bare `>` redirect and no
  # `mkdir -p` safety net, unlike its NB_DIR creation path.
  [[ -d ${NBRC_PATH:h} ]] || mkdir -p -- "${NBRC_PATH:h}"
fi
if [[ -z ${NB_DIR:-} && ! -e ${HOME}/.nb ]]; then
  export NB_DIR="${XDG_DATA_HOME:-${HOME}/.local/share}/nb"
fi
if [[ -z ${NB_HIST:-} && ! -e ${HOME}/.nb_history ]]; then
  export NB_HIST="${XDG_STATE_HOME:-${HOME}/.local/state}/nb/history"
fi
# --- end nb XDG Base Directory defaults -------------------------------------

# https://wiki.zshell.dev/community/zsh_plugin_standard#funtions-directory
if [[ $PMSPEC != *f* ]]; then
  fpath+=( "${0:h}/functions" )
fi

# https://wiki.zshell.dev/community/zsh_plugin_standard#binaries-directory
if [[ $PMSPEC != *b* ]]; then
  path+=( "${0:h}/bin" )
fi
