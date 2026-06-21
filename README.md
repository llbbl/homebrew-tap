# llbbl/homebrew-tap

Homebrew formulae for [llbbl](https://github.com/llbbl) tools.

## Usage

```bash
brew install llbbl/tap/lsm
```

Or tap once, then install (and upgrade) normally:

```bash
brew tap llbbl/tap
brew install lsm
```

## Formulae

| Formula | Description | Upstream |
|---------|-------------|----------|
| `lsm` | Per-app, per-environment age-encrypted secrets manager | [llbbl/lsm](https://github.com/llbbl/lsm) |
| `dfm` | Manage, version, and AI-improve dotfiles with a private backup repo | [llbbl/dotfiles-manager](https://github.com/llbbl/dotfiles-manager) |
| `upkeep` | JS/TS repository maintenance toolkit built with Bun | [llbbl/upkeep](https://github.com/llbbl/upkeep) |

## Maintaining

Each formula installs a prebuilt binary from its project's GitHub release
archives. On a new upstream release, bump the formula's `version`, `url`s, and
`sha256`s (the checksums are published in each release's `checksums.txt`).
