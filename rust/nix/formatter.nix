{
  inputs,
  pkgs,
  perSystem,
  ...
}:
let
  treefmtEval = inputs.treefmt.lib.evalModule pkgs (
    import ./treefmt.nix { inherit inputs perSystem; }
  );
in
treefmtEval.config.build.wrapper
