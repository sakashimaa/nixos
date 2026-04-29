{ pkgs, config, ... }:

{
  imports = [
    ./home-modules/fish.nix
    ./home-modules/git.nix
    ./home-modules/foot.nix
    ./home-modules/cava.nix
    ./home-modules/fastfetch.nix
    ./home-modules/nvim.nix
    ./home-modules/spotify-player.nix
    ./home-modules/rofi.nix
    ./home-modules/wallpaper.nix
    ./home-modules/lock.nix
    ./home-modules/theme.nix
  ];

  sops = {
    age.keyFile = "/home/yoko/.config/sops/age/keys.txt";

    defaultSopsFile = ./secrets.yaml;
    defaultSymlinkPath = "/run/user/1000/secrets";
    defaultSecretsMountPoint = "/run/user/1000/secrets.d";

    secrets.claude_api_key = {
      path = "${config.sops.defaultSymlinkPath}/claude_api_key";
    };
  };

  home.sessionVariables = {
    ANTHROPIC_BASE_URL="http://185.193.127.242/anthropic";
    ANTHROPIC_MODEL="claude-opus-latest";
    ANTHROPIC_DEFAULT_OPUS_MODEL="claude-opus-4-6";
    ANTHROPIC_DEFAULT_SONNET_MODEL="claude-sonnet-4-6";
    ANTHROPIC_DEFAULT_HAIKU_MODEL="claude-haiku-4-5";
    CLAUDE_CODE_SUBAGENT_MODEL="claude-sonnet-4-6";
    CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC="0";
  };

  home.enableNixpkgsReleaseCheck = false;

  services.theme = {
    enable = true;
    palette = "nord";
  };

  services.lock = {
    enable = true;
    lock_timeout = 300;
    off_timeout = 600;
  };

  services.wallpaper = {
    enable = true;
    path = "/home/yoko/wallpapers/nix-chan.png";
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = "yazi.desktop";
      "text/html" = "zen.desktop";
      "x-scheme-handler/http" = "zen.desktop";
      "x-scheme-handler/https" = "zen.desktop";
      "x-scheme-handler/about" = "zen.desktop";
      "x-scheme-handler/unknown" = "zen.desktop";
    };
  };

  home.username = "yoko";
  home.homeDirectory = "/home/yoko";

  home.stateVersion = "25.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    btop
    htop
    age
    sops
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/yoko/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
