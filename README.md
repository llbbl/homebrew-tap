# llbbl/homebrew-tap

Homebrew formulae for [llbbl](https://github.com/llbbl) tools.

## Usage

```bash
brew install llbbl/tap/lsm
```

Installing by fully qualified name trusts that formula. Homebrew 6.0 and later
require explicit trust before loading packages from non-official taps.

Or tap once, trust the specific formula, then install by short name:

```bash
brew tap llbbl/tap
brew trust --formula llbbl/tap/lsm
brew install lsm
```

Replace `lsm` with `dfm`, `upkeep`, `uncov`, or `agentsync` to trust and install another formula.

### Trust the whole tap

To trust all packages in this tap:

```bash
brew tap llbbl/tap
brew trust --tap llbbl/tap
brew install lsm
```

Whole-tap trust covers every current and future formula, cask, and external
command in that tap. Prefer formula-specific trust when you only need one tool.

Run `brew trust` to list trusted entries. See Homebrew's
[Tap Trust documentation](https://docs.brew.sh/Tap-Trust) for details.

### Migrate uncov from the old tap

`uncov` now lives in this shared tap. For a new installation:

```bash
brew install llbbl/tap/uncov
```

If you installed it from `llbbl/uncov`, trust the destination before updating:

```bash
brew tap llbbl/tap
brew trust --formula llbbl/tap/uncov
brew update
brew upgrade llbbl/tap/uncov
```

The old tap's migration mapping lets Homebrew update existing installations to
use `llbbl/tap`. Once `brew info uncov` identifies the shared tap, remove the old
tap with `brew untap llbbl/uncov`.

If migration was previously skipped, run `brew reinstall llbbl/tap/uncov` before
removing the old tap. Update Brewfiles and scripts to use `llbbl/tap/uncov`
instead of `llbbl/uncov/uncov`.

## Formulae

| Formula | Description | Upstream |
|---------|-------------|----------|
| `lsm` | Per-app, per-environment age-encrypted secrets manager | [llbbl/lsm](https://github.com/llbbl/lsm) |
| `dfm` | Manage, version, and AI-improve dotfiles with a private backup repo | [llbbl/dotfiles-manager](https://github.com/llbbl/dotfiles-manager) |
| `upkeep` | JS/TS repository maintenance toolkit built with Bun | [llbbl/upkeep](https://github.com/llbbl/upkeep) |
| `uncov` | Report files with low test coverage from Vitest/Istanbul output | [llbbl/uncov](https://github.com/llbbl/uncov) |
| `agentsync` | Provision Claude Code agents into projects as symlinks from one canonical repo | [agentic-tooling/agentsync](https://github.com/agentic-tooling/agentsync) |

## Maintaining

Each formula installs a prebuilt binary from its project's GitHub releases.
Scheduled workflows poll upstream every six hours and regenerate formulas after
a 24-hour hold. Manual dispatch with `force: true` bypasses the hold.

Update the matching `scripts/render-*-formula.sh` (or `scripts/render-formula.sh`
for `lsm`) for durable formula changes. Release bumps update `version`, artifact
URLs, and SHA-256 values. `lsm`, `dfm`, `upkeep`, and `agentsync` use upstream `checksums.txt`;
`uncov` ships bare binaries, so its updater downloads the three supported Unix
binaries and computes their SHA-256 hashes directly.
