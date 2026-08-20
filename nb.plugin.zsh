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

# Documented global effect: exports NBRC_PATH, NB_DIR, and NB_HIST.
#
# nb defaults all three to $HOME. Give them XDG Base Directory values
# instead, but only when the legacy $HOME path does not already exist, so
# an existing install keeps working and only a fresh one moves. -L catches
# a dangling symlink: an unstowed dotfiles link still means the user put a
# config there, and silently redirecting them to a different one is worse
# than pointing at the path they chose.
#
# Declaring any of them before this plugin loads always wins, same as
# every other nb variable: https://xwmx.github.io/nb/#-variables
[[ -e ${HOME}/.nbrc || -L ${HOME}/.nbrc ]] ||
  : ${NBRC_PATH:=${XDG_CONFIG_HOME:-${HOME}/.config}/nb/nbrc}
[[ -e ${HOME}/.nb || -L ${HOME}/.nb ]] ||
  : ${NB_DIR:=${XDG_DATA_HOME:-${HOME}/.local/share}/nb}
[[ -e ${HOME}/.nb_history || -L ${HOME}/.nb_history ]] ||
  : ${NB_HIST:=${XDG_STATE_HOME:-${HOME}/.local/state}/nb/history}

# Export unconditionally, so a plain `NB_DIR=…` assignment made before this
# plugin loads still reaches nb, which runs as an external command. Skip
# the ones left unset above, rather than exporting empty variables into
# every child process.
[[ -n ${NBRC_PATH-} ]] && typeset -gx NBRC_PATH
[[ -n ${NB_DIR-} ]] && typeset -gx NB_DIR
[[ -n ${NB_HIST-} ]] && typeset -gx NB_HIST

# Create the parent directories the defaults point into. Upstream `nb init`
# writes NBRC_PATH with a bare `>` redirect and no `mkdir -p` safety net,
# unlike its NB_DIR creation path, and nb assigns NB_HIST straight to
# HISTFILE, where a missing directory loses the history silently.
[[ -z ${NBRC_PATH-} || -e ${NBRC_PATH} || -d ${NBRC_PATH:h} ]] ||
  mkdir -p -- "${NBRC_PATH:h}"
[[ -z ${NB_HIST-} || -e ${NB_HIST} || -d ${NB_HIST:h} ]] ||
  mkdir -p -- "${NB_HIST:h}"

# https://wiki.zshell.dev/community/zsh_plugin_standard#funtions-directory
if [[ $PMSPEC != *f* ]]; then
  fpath+=( "${0:h}/functions" )
fi

# https://wiki.zshell.dev/community/zsh_plugin_standard#binaries-directory
if [[ $PMSPEC != *b* ]]; then
  path+=( "${0:h}/bin" )
fi
