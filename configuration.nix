{
  lib,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./modules/packages.nix
    ./modules/networking.nix
    ./modules/sound.nix
    ./modules/locale.nix
    ./modules/fonts.nix
    ./modules/system.nix
    ./modules/user.nix
    ./modules/sops.nix
    ./modules/wallpaper.nix
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "claude-code"
    ];

  services.wallpaper = {
    enable = true;
    path = "/home/yoko/wallpapers/nix-chan.png";
  };
}
