{ inputs, perSystem }:
let
  rustToolchain = import ./rust-toolchain.nix { inherit perSystem; };
in
{
  projectRootFile = "flake.nix";

  programs.nixfmt.enable = true;
  programs.rustfmt = {
    enable = true;
    package = rustToolchain;
  };
}
