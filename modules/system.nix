{ pkgs, ... }:
{

  system.activationScripts.gitBackup = ''
    export PATH=${pkgs.openssh}/bin:$PATH
    export HOME=/root
    cd /etc/nixos && \
    ${pkgs.git}/bin/git config user.email "yokko@nixos" && \
    ${pkgs.git}/bin/git config user.name "yokko" && \
    ${pkgs.git}/bin/git add -A && \
    ${pkgs.git}/bin/git commit -m "auto: $(date)" && \
    ${pkgs.git}/bin/git push -u origin main >> /tmp/nixos-backup.log 2>&1 || true
  '';

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
  programs.niri.enable = true;

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11";
}
