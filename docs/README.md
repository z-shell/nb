<h1 align="center">
  <a href="https://github.com/z-shell/zi">
  <img align="center" src="https://github.com/z-shell/zi/raw/main/docs/images/logo.png" alt="Logo" width="60px" height="60px" /></a>
  ❮ Zsh + Nb ❯</h1>
<div align="center">
<h2>
  <img align="center" src="https://raw.githubusercontent.com/xwmx/nb/master/docs/assets/images/nb.png" alt="xwmx/nb" width="60%" height="auto" />
</h2>

## Feature-rich, next level notes by [`xwmx/nb`](https://github.com/xwmx/nb)

<h3>
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
</h3>

</div><hr />

### [Zi](https://github.com/z-shell/zi)

[Standard syntax](https://wiki.zshell.dev/docs/guides/syntax/common#standard-syntax)

```zsh
zi light z-shell/nb
```

[Turbo Mode + "For" syntax](https://wiki.zshell.dev/docs/getting_started/overview#turbo-mode-zsh--53)

```zsh
zi wait lucid for z-shell/nb
```

[Zi](https://github.com/z-shell/zi) package

```shell
zi pack for nb
```

> The package installed locally into a plugin directory and provided to the command line through _shims_, i.e.: automatic forwarder scripts created under `$ZPFX/bin` (which is added to the `$PATH` by default; shims are also a bin-gem-node annex feature).

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
