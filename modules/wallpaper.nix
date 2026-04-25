{
  config,
  lib,
  ...
}:
let
  cfg = config.services.wallpaper;
in
{
  options.services.wallpaper = {
    enable = lib.mkEnableOption "wallpaper service";
    path = lib.mkOption {
      type = lib.types.str;
      description = "Path to the wallpaper.";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.etc."hyprpaper.conf".text = ''
      preload = ${cfg.path}
      wallpaper = ,${cfg.path}
    '';
  };
}
