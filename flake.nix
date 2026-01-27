{
  description = "My collection of Nix Flake templates";

  outputs = _: {
    templates = {
      neovim-plugin = {
        path = ./neovim-plugin;
        description = "A template for creating Neovim plugins";
      };
      rust = {
        path = ./rust;
        description = "Rust project with crane, fenix, mold, and sccache";
      };
    };
  };
}
