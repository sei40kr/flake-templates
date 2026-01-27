{
  inputs,
  pkgs,
  perSystem,
  ...
}:
let
  treefmtEval = inputs.treefmt.lib.evalModule pkgs (
    import ../treefmt.nix { inherit inputs perSystem; }
  );
  rustToolchain = import ../rust-toolchain.nix { inherit perSystem; };
in
inputs.git-hooks.lib.${pkgs.stdenv.hostPlatform.system}.run {
  src = inputs.self;
  hooks = {
    clippy = {
      enable = true;
      packageOverrides = {
        cargo = rustToolchain;
        clippy = rustToolchain;
      };
      settings.denyWarnings = true;
    };
    nil.enable = true;
    statix.enable = true;
    treefmt = {
      enable = true;
      packageOverrides = {
        treefmt = treefmtEval.config.build.wrapper;
      };
    };
  };
}
