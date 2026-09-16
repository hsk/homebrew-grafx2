# hsk/grafx2

A [Homebrew](https://brew.sh) tap for [GrafX2](https://gitlab.com/GrafX2/grafx2), the 256-color pixel art painting program.

Homebrew's own `grafx2` cask ships upstream's prebuilt app, which has been
disabled since 2026-09-01 because it fails the macOS Gatekeeper check. This
tap instead builds GrafX2 natively from source against Homebrew-provided
SDL2, Lua, libpng, etc., using the "homebrew" build target that GrafX2
added for modern macOS. That target isn't in any tagged release yet
(latest tag is `v2.9`, from April 2024), so the formula is pinned to the
commit on `master` that introduced it.

## Install

```
brew install hsk/grafx2/grafx2
```

or

```
brew tap hsk/grafx2
brew install grafx2
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
