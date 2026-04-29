{ ... }:
{
  programs.fish = {
    enable = true;

    interactiveShellInit = builtins.readFile ../dotfiles/fish/config.fish;

    functions = {
      fish_greeting = "function fish_greeting
    fastfetch --key-padding-left 5
end";
    };
  };

  xdg.configFile."fish/conf.d/nvm.fish".source = ../dotfiles/fish/conf.d/nvm.fish;
  xdg.configFile."fish/conf.d/rustup.fish".source = ../dotfiles/fish/conf.d/rustup.fish;
}
