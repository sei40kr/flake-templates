{ perSystem }:
perSystem.fenix.stable.withComponents [
  "cargo"
  "clippy"
  "rust-analyzer"
  "rust-src"
  "rustc"
  "rustfmt"
]
