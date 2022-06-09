<h1 align="center">
  <p><a href="https://github.com/z-shell/zi">
  <img align="center" src="https://github.com/z-shell/zi/raw/main/docs/images/logo.svg" alt="Logo" width="60px" height="60px" /></a>
  ❮ ZI ❯ Package - nb </p>
</h1>
<h2 align="center">
    <p> Feature-rich note‑taking </p></h2>
<h3 align="center">
<table>
    <tr>
        <td><b>Package source:</b></td>
        <td>Source Tarball</td>
        <td>Git</td>
        <td>Node</td>
        <td>Gem</td>
    </tr>
    <tr>
        <td><b>Status:</b></td>
        <td>✔️ (default)</td>
        <td>➖</td>
        <td>❌</td>
        <td>❌</td>
    </tr>
</table></h3><hr />

### Available `pack''` invocations

The package installed locally into a plugin directory and provided to the command line through _shims_, i.e.: automatic forwarder scripts created under `$ZPFX/bin` (which is added to the `$PATH` by default; shims are also a bin-gem-node annex feature).

```shell
zi pack for nb
```

### Default Profile

```shell
zi ice as'completion' nocompile sbin'nb' \
  depth'3' atclone'mv -vf etc/nb-completion.zsh _nb'
zi light @xwmx/nb
```

```shell
# Same as above, except using the For syntax
zi for as'completion' nocompile sbin'nb' \
  depth'3' atclone'mv -vf etc/nb-completion.zsh _nb' \
    @xwmx/nb
```

---

> This repository compatible with [ZI](https://github.com/z-shell/zi)

The [xwmx/nb](https://github.com/xwmx/nb/) zsh package that uses the [zsh-string-lib](https://github.com/z-shell/zsh-string-lib) to automatically:

- get the plugin's Git repository OR release-package URL,
- get the list of the recommended ices for the plugin,
  - there can be multiple lists of ices,
  - the ice lists are stored in _profiles_; there's at least one profile, _default_,
  - the ices can be selectively overridden.
