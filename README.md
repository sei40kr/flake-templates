# flake-templates

My collection of Nix Flake templates.

## Usage

```bash
nix flake init -t github:sei40kr/flake-templates#<template>
```

See `Templates` section below for available templates.

## Templates

### rust

A Rust project template.

- [Crane](https://crane.dev) build with two-stage dependency caching
- [fenix](https://github.com/nix-community/fenix) toolchain management (cargo, clippy, rust-analyzer, rustfmt, etc.)
- Fast builds with [mold](https://github.com/rui314/mold) linker & [sccache](https://github.com/mozilla/sccache)
- [treefmt](https://github.com/numtide/treefmt) formatting (nixfmt, rustfmt)
- Pre-commit hooks via [git-hooks.nix](https://github.com/cachix/git-hooks.nix) (clippy, nil, statix, treefmt)
- direnv support (`.envrc`)

### neovim-plugin

A Neovim plugin template.

- Lua-based plugin structure (`lua/<plugin>/init.lua`)
- Packaging with `vimUtils.buildVimPlugin`
- Dev shell with an isolated Neovim instance preloaded with the plugin
