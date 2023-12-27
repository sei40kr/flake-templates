{ vimUtils }:

vimUtils.buildVimPlugin {
  pname = "plugin";
  version = "1.0.0";
  src = ./.;
}
