{ ... }:
{
  programs.git = {
    enable = true;
  };

  programs.git.settings = {
    init.defaultBranch = "main";
    user.name = "yoko";
    user.email = "yokkoshima@icloud.com";
  };
}
