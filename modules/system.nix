{ pkgs, niri, ... }:
{
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  users.users.yoko.extraGroups = [ "docker" ];

  security.pam.services.hyprlock = { };

  environment.sessionVariables = {
ANTHROPIC_AUTH_TOKEN="sk-fp-e890e105-f5a0-433b-b370-2df59cbf8a87";
ANTHROPIC_BASE_URL="http://185.193.127.242/anthropic";
ANTHROPIC_MODEL="claude-opus-latest";
ANTHROPIC_DEFAULT_OPUS_MODEL="claude-opus-latest";
ANTHROPIC_DEFAULT_SONNET_MODEL="claude-sonnet-4-6";
ANTHROPIC_DEFAULT_HAIKU_MODEL="claude-haiku-4-5";
CLAUDE_CODE_SUBAGENT_MODEL="claude-sonnet-4-6";
CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC= "0";
  };

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

  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.enable = true;

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
