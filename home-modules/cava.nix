{ ... }:
{
  home.file.".config/cava" = {
    source = ../dotfiles/cava;
    recursive = true;
  };
}
