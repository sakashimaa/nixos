{ pkgs, niri, ... }:
{
  security.pam.services.hyprlock = { };

  nixpkgs.overlays = [
    niri.overlays.niri
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  system.activationScripts.gitBackup = ''
    export PATH=${pkgs.openssh}/bin:$PATH
    export HOME=/root
    ${pkgs.git}/bin/git config --global --add safe.directory /etc/nixos
    ${pkgs.git}/bin/git -C /etc/nixos add -A
    ${pkgs.git}/bin/git -C /etc/nixos commit -m "auto: $(date)" || true
    ${pkgs.git}/bin/git -C /etc/nixos push -u origin main || true
  '';

  environment.sessionVariables = {
    XCURSOR_THEME = "catppuccin-mocha-dark-cursors";
    XCURSOR_SIZE = "24";
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.xserver.enable = true;

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  programs.hyprland.enable = true;
  programs.yazi.enable = true;
  programs.direnv.enable = true;

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11";
}
