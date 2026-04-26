{ ... }:
{
  home.file.".config/fish" = {
    source = ../dotfiles/fish;
    recursive = true;
  };
}
