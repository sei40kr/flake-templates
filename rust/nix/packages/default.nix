{
  inputs,
  pkgs,
  perSystem,
  ...
}:
let
  rustToolchain = import ../rust-toolchain.nix { inherit perSystem; };
  craneLib = (inputs.crane.mkLib pkgs).overrideToolchain rustToolchain;

  commonArgs = {
    src = craneLib.cleanCargoSource inputs.self;
    strictDeps = true;
  };

  cargoArtifacts = craneLib.buildDepsOnly commonArgs;
in
craneLib.buildPackage (
  commonArgs
  // {
    inherit cargoArtifacts;
  }
)
