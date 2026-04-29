{ ... }:
{
  programs.fish.enable = true;

  home.file.".config/fish" = {
    source = ../dotfiles/fish;
    recursive = true;
  };
}
