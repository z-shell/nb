# -*- mode: zsh; sh-indentation: 2; indent-tabs-mode: nil; sh-basic-offset: 2; -*-
# vim: ft=zsh sw=2 ts=2 et
#
# lib/xdg-defaults.zsh
#
# Export NBRC_PATH, NB_DIR, and NB_HIST with XDG Base Directory defaults,
# but only when the corresponding legacy $HOME path does not already exist.
# An existing ~/.nbrc or ~/.nb install keeps working exactly as before;
# only a fresh install gets XDG-compliant paths, with nothing written to
# $HOME. Declaring any of these three yourself before nb loads -- in your
# .zshrc, in an ice, or in your own nbrc -- always wins over this default,
# same as every other nb variable; see https://xwmx.github.io/nb/#-variables
#
# Sourced from three places that must stay in sync: nb.plugin.zsh's
# sourced-library body, and the `atinit` ice in package.json and
# docs/README.md's Zi recipes -- the latter two because Zi's
# `as'program'`/`as'completion'` install modes (this plugin's documented
# recipes) never source nb.plugin.zsh itself.
[[ -e ${HOME}/.nbrc ]] ||
  : ${NBRC_PATH:=${XDG_CONFIG_HOME:-${HOME}/.config}/nb/nbrc}
[[ -e ${HOME}/.nb ]] ||
  : ${NB_DIR:=${XDG_DATA_HOME:-${HOME}/.local/share}/nb}
[[ -e ${HOME}/.nb_history ]] ||
  : ${NB_HIST:=${XDG_STATE_HOME:-${HOME}/.local/state}/nb/history}

typeset -gx NBRC_PATH NB_DIR NB_HIST

# Upstream `nb init` writes NBRC_PATH with a bare `>` redirect and no
# `mkdir -p` safety net, unlike its NB_DIR creation path.
[[ -e ${NBRC_PATH} || -d ${NBRC_PATH:h} ]] || mkdir -p -- "${NBRC_PATH:h}"
