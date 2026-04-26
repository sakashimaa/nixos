{ ... }:
{
  xdg.configFile."rofi/powermenu.sh" = {
    text = ''
      #!/usr/bin/env bash

      chosen=$(printf " Lock\n Logout\n Reboot\n Shutdown" | rofi -dmenu -theme ~/.config/rofi/config.rasi -p "Power")

      case "$chosen" in
        " Lock") hyprlock ;;
        " Logout") hyprctl dispatch exit ;;
        " Reboot") systemctl reboot ;;
        " Shutdown") systemctl poweroff ;;
      esac
    '';
    executable = true;
  };

  programs.rofi = {
    enable = true;
  };
}
