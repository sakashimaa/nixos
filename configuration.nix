{
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
  ];
}
