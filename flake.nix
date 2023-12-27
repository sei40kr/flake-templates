{
  description = "My collection of Nix Flake templates";

  outputs = { ... }: {
    templates = {
      neovim-plugin = {
        path = ./neovim-plugin;
        description = "A template for creating Neovim plugins";
      };
    };
  };
}
