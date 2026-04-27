{ ... }:
{
  programs.git = {
    enable = true;
  };

  programs.git.settings = {
    user = {
      email = "yokkoshima@icloud.com";
      name = "yoko";
    };
    init.defaultBranch = "main";
    credential.helper = "store";
  };
}
