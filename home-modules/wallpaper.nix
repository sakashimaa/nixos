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
    xdg.configFile."hypr/hyprpaper.conf".text = ''
      wallpaper {
        monitor = DP-1
        path = ${cfg.path}
        fit_mode = cover
      }
    '';
  };
}
