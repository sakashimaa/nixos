{ config, lib, ... }:
let
  cfg = config.services.lock;
in
{
  options.services.lock = {
    enable = lib.mkEnableOption "lock service";
    lock_timeout = lib.mkOption {
      type = lib.types.int;
      description = "Seconds to lock";
    };
    off_timeout = lib.mkOption {
      type = lib.types.int;
      description = "Seconds to off PC";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.hyprlock.enable = true;

    services.hypridle = {
      enable = true;
      settings = {
        listener = [
          {
            timeout = cfg.lock_timeout;
            on-timeout = "hyprlock";
          }
          {
            timeout = cfg.off_timeout;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
        ];
      };
    };
  };
}
