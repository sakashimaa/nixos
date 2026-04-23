{ pkgs, ... }:
{
  users.users.yoko = {
    isNormalUser = true;

    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [

    ];
  };
}
