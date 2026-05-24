# GetSmallAI Homebrew Tap

Homebrew tap for [Small Harness](https://github.com/GetSmallAI/SmallHarness) — a terminal-based agent harness for running small LLMs on your Mac.

## Install

```sh
brew install getsmallai/tap/small-harness
```

This installs the latest released `small-harness` binary for your Mac (Apple Silicon or Intel).

## First launch

The release binaries are **not yet notarized**, so macOS Gatekeeper will block them on first launch with a warning like *"cannot be opened because the developer cannot be verified."*

To get past it, run the binary from Finder once: right-click (or Control-click) `small-harness` → **Open** → **Open** in the confirmation dialog. After that, macOS will remember the approval and subsequent runs from the terminal will work normally.

Notarization is on the roadmap.

## Upgrading

```sh
brew update
brew upgrade small-harness
```

## Issues

Please file issues against the main project repo: <https://github.com/GetSmallAI/SmallHarness/issues>.
