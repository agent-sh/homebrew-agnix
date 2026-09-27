# homebrew-agnix

Homebrew tap for [agnix](https://github.com/agent-sh/agnix) — AI agent configuration linter.

## Install

```bash
brew tap agent-sh/agnix
brew install agnix
```

## Update

```bash
brew update
brew upgrade agnix
```

## How it works

The agnix release workflow opens a formula update pull request for each new
release. The formula changes land after review and CI.
The manual `Verify Formula for Release` workflow checks the merged formula
against the tagged source archive without changing files.
