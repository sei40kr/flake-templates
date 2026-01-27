{
  inputs,
  pkgs,
  perSystem,
  ...
}:
let
  pre-commit-check = import ./checks/pre-commit-check.nix { inherit inputs pkgs perSystem; };
  rustToolchain = import ./rust-toolchain.nix { inherit perSystem; };
in
pkgs.mkShell {
  packages = [
    rustToolchain
    pkgs.openssl
    pkgs.pkg-config
    pkgs.mold
    pkgs.sccache
  ];

  env = {
    RUSTC_WRAPPER = "${pkgs.sccache}/bin/sccache";
    RUSTFLAGS = "-C link-arg=-fuse-ld=${pkgs.mold}/bin/mold";
  };

  shellHook = ''
    ${pre-commit-check.shellHook}
  '';
}
