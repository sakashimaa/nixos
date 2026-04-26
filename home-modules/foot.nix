{ ... }:
{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        shell = "fish";
        title = "foot";
        font = "JetBrainsMono Nerd Font Mono:size=12, Noto Sans Symbols 2:size=12";
        letter-spacing = 0;
        dpi-aware = "no";
        pad = "25x25";
        bold-text-in-bright = "no";
        gamma-correct-blending = "no";
      };
      cursor = {
        style = "beam";
        beam-thickness = 1.5;
      };
      scrollback = {
        lines = 10000;
      };
      key-bindings = {
        scrollback-up-page = "Page_Up";
        scrollback-down-page = "Page_Down";
        search-start = "Control+Shift+f";
      };
      search-bindings = {
        cancel = "Escape";
        find-prev = "Shift+F3";
        find-next = "F3 Control+G";
      };
      colors-dark = {
        background = "282828";
        foreground = "ebdbb2";
      };
    };
  };
}
