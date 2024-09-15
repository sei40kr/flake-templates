{
  mkShell,
  neovim,
  plugin,
}:

mkShell {
  buildInputs = [
    (neovim.override {
      configure = {
        customRC = ''
          lua <<EOF
          local plugin = require("plugin")

          plugin.setup({})
          EOF
        '';
        packages.myVimPackage.start = [ plugin ];
      };
    })
  ];
  shellHook = ''
    export NVIM_LOG_FILE=log
    export VIM=
    export VIMRUNTIME=
    export XDG_CONFIG_HOME=$(mktemp -d)
    export XDG_DATA_HOME=$(mktemp -d)
    export VIMINIT=
    exec nvim
  '';
}
