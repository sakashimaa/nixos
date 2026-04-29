{ ... }:
{
  programs.fish = {
    enable = true;

    interactiveShellInit = builtins.readFile ../dotfiles/fish/config.fish;

    shellInit = ''
      if test -r /run/user/1000/secrets/claude_api_key 
        set -gx ANTHROPIC_AUTH_TOKEN (cat /run/user/1000/secrets/claude_api_key) 
      end
    '';

    functions = {
      fish_greeting = "fastfetch --key-padding-left 5";
    };
  };

  xdg.configFile."fish/conf.d/nvm.fish".source = ../dotfiles/fish/conf.d/nvm.fish;
  xdg.configFile."fish/conf.d/rustup.fish".source = ../dotfiles/fish/conf.d/rustup.fish;
}
