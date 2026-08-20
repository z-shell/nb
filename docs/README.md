<h1 align="center">
  <a href="https://github.com/z-shell/zi">
  <img align="center" src="https://github.com/z-shell/zi/raw/main/docs/images/logo.png" alt="Logo" width="60px" height="60px" /></a>
  ❮ Zsh + Nb ❯
</h1>
<h1 align="center">

Feature-rich, next level notebook by [`xwmx/nb`](https://github.com/xwmx/nb)

</h1>
<div align="center">
  <p><img align="center" src="https://raw.githubusercontent.com/xwmx/nb/master/docs/assets/images/nb.png" alt="xwmx/nb" width="60%" height="auto" /><p>
  <p><img align="center" src="https://user-images.githubusercontent.com/59910950/208317498-a5746464-5beb-4ca3-8c6c-39ea7817d40d.gif" alt="xwmx/nb" width="100%" height="auto" /></p>
</div>

<div align="center">
<h2>
<table>
    <tr>
        <td><b>Package source:</b></td>
        <td>Source Tarball</td>
        <td>Bin</td>        
        <td>Git</td>
        <td>Node</td>
        <td>Gem</td>
    </tr>
    <tr>
        <td><b>Status:</b></td>
        <td>❌</td>
        <td>✔️</td>
        <td>✔️</td>
        <td>✔️</td>
        <td>❌</td>
    </tr>
   </table>
</h2>

</div><hr />

### [Zi](https://github.com/z-shell/zi)

[Standard syntax](https://wiki.zshell.dev/docs/guides/syntax/common#standard-syntax)

```zsh
zi ice depth'1' as'program' pick'bin/*' blockf atinit'source ./lib/xdg-defaults.zsh'
zi light z-shell/nb
```

[Standard syntax + Bin Gem Node](https://wiki.zshell.dev/ecosystem/annexes/bin-gem-node)

```shell
zi ice depth'1' as'program' sbin'bin/*' blockf atinit'source ./lib/xdg-defaults.zsh'
zi light z-shell/nb
```

[Turbo Mode + "For" syntax](https://wiki.zshell.dev/docs/getting_started/overview#turbo-mode-zsh--53)

```shell
zi wait lucid for \
  depth'1' as'program' sbin'bin/*' blockf atinit'source ./lib/xdg-defaults.zsh' \
    z-shell/nb
```

[Zi](https://github.com/z-shell/zi) package

```shell
zi pack for nb
```

> The package installed locally into a plugin directory and provided to the command line through _shims_, i.e.: automatic forwarder scripts created under `$ZPFX/bin` (which is added to the `$PATH` by default; shims are also a bin-gem-node annex feature).

### Variables

`nb` writes its notebooks and configuration under `$HOME` by default. This
plugin exports `NBRC_PATH`, `NB_DIR`, and `NB_HIST` with
[XDG Base Directory](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)
defaults instead — but only when you have not already set the variable
yourself **and** its legacy `$HOME` path does not already exist. An
existing `~/.nbrc` or `~/.nb` install keeps working exactly as before;
only a fresh install gets XDG-compliant paths.

| Variable    | XDG default                                        | Skipped when this already exists |
| ----------- | -------------------------------------------------- | -------------------------------- |
| `NBRC_PATH` | `${XDG_CONFIG_HOME:-$HOME/.config}/nb/nbrc`        | `~/.nbrc`                        |
| `NB_DIR`    | `${XDG_DATA_HOME:-$HOME/.local/share}/nb`          | `~/.nb`                          |
| `NB_HIST`   | `${XDG_STATE_HOME:-$HOME/.local/state}/nb/history` | `~/.nb_history`                  |

Every other `nb` variable (editor, theme, sync, encryption tool, …) is
already picked up the same way by `nb` itself: export it before `nb` runs
and it takes effect. See
[nb's variables reference](https://xwmx.github.io/nb/#-variables) for the
full list.

The defaulting logic lives in one place, [`lib/xdg-defaults.zsh`](../lib/xdg-defaults.zsh).
`as'program'` and `as'completion'` — the modes the recipes above and
`package.json`'s `zi-ices` both use — never source `nb.plugin.zsh`, so
each recipe's `atinit` sources `lib/xdg-defaults.zsh` directly instead;
it's already part of the recipes above, you don't need to add anything
yourself. Managers that do source `nb.plugin.zsh` directly, such as
Oh-My-Zsh and Zgen below, get the same file sourced from the plugin body.

### [Oh-My-Zsh](https://github.com/ohmyzsh/ohmysh)

> Clone repostory and add `nb` to your plugin list.

```shell
git clone https://github.com/z-shell/nb.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/nb
```

### [Zgen](https://github.com/tarjoilija/zgen)

> Add the following to your `.zshrc` file in the same place you're doing your other `zgen load` calls in.

```shell
zgen load z-shell/nb
```
