{ config, lib, ... }:
let
  strip = color: builtins.replaceStrings [ "#" ] [ "" ] color;

  cfg = config.services.theme;
  palettes = {
    gruvbox-dark = {
      bg = "#282828";
      bg-alt = "#3c3836";
      fg = "#ebdbb2";
      accent = "#d79921";
      urgent = "#cc241d";
      color1 = "#83a598";
      color2 = "#d3869b";
      color3 = "#b8bb26";
      regular2 = "#98971a";
      regular4 = "#458588";
      regular5 = "#b16286";
      regular6 = "#689d6a";
      regular7 = "#a89984";

      bright0 = "#928374";
      bright1 = "#fb4934";
      bright2 = "#b8bb26";
      bright3 = "#fabd2f";
      bright4 = "#83a598";
      bright5 = "#d3869b";
      bright6 = "#8ec07c";
      bright7 = "#ebdbb2";

      selection-background = "#ebdbb2";
      selection-foreground = "#ebdbb2";

      urls = "#83a598";
    };
    nord = {
      bg = "#2e3440";
      bg-alt = "#3b4252";
      fg = "#eceff4";
      accent = "#88c0d0";
      urgent = "#bf616a";
      color1 = "#81a1c1";
      color2 = "#b48ead";
      color3 = "#a3be8c";
      regular2 = "#a3be8c";
      regular4 = "#81a1c1";
      regular5 = "#b48ead";
      regular6 = "#88c0d0";
      regular7 = "#e5e9f0";
      bright0 = "#4c566a";
      bright1 = "#bf616a";
      bright2 = "#a3be8c";
      bright3 = "#ebcb8b";
      bright4 = "#81a1c1";
      bright5 = "#b48ead";
      bright6 = "#8fbcbb";
      bright7 = "#eceff4";
      selection-background = "#434c5e";
      selection-foreground = "#eceff4";
      urls = "#88c0d0";
    };
  };
  colors = palettes.${cfg.palette};
in
{
  options.services.theme = {
    enable = lib.mkEnableOption "theme service";
    palette = lib.mkOption {
      type = lib.types.str;
      description = "Color palette";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.foot.settings = {
      colors-dark = {
        regular0 = strip colors.bg;
        regular1 = strip colors.urgent;
        regular2 = strip colors.regular2;
        regular3 = strip colors.accent;
        regular4 = strip colors.regular4;
        regular5 = strip colors.regular5;
        regular6 = strip colors.regular6;
        regular7 = strip colors.regular7;

        bright0 = strip colors.bright0;
        bright1 = strip colors.bright1;
        bright2 = strip colors.bright2;
        bright3 = strip colors.bright3;
        bright4 = strip colors.bright4;
        bright5 = strip colors.bright5;
        bright6 = strip colors.bright6;
        bright7 = strip colors.bright7;

        selection-background = strip colors.selection-background;
        selection-foreground = strip colors.selection-foreground;

        urls = strip colors.urls;
      };
    };
    xdg.configFile."mako/config".text = ''
      max-visible=3
      sort=-time

      font=JetBrains Mono Nerd Font 11
      width=350
      height=150
      padding=15
      margin=10
      border-size=2
      border-radius=8

      background-color=${colors.bg}
      text-color=${colors.fg}
      border-color=${colors.accent}

      default-timeout=3000

      [urgency=low]
      background-color=${colors.bg-alt}
      border-color=${colors.bright0}

      [urgency=normal]
      background-color=${colors.bg}
      border-color=${colors.accent}

      [urgency=critical]
      background-color=${colors.urgent}
      text-color=${colors.fg}
      border-color=${colors.bright1}
      default-timeout=0
    '';
    xdg.configFile."waybar/style.css".text = ''
      @define-color background ${colors.bg};
      @define-color second-background ${colors.bg-alt};
      @define-color text ${colors.fg};
      @define-color borders ${colors.bright0};
      @define-color focused ${colors.accent};
      @define-color focused2 ${colors.bright2};
      @define-color color1 ${colors.bright4};
      @define-color color2 ${colors.bright5};
      @define-color color3 ${colors.bright2};
      @define-color urgent ${colors.urgent};


      /* font declared */
      * {
        font-family: "JetBrains Mono Nerd Font";
        font-size: 16px;
      }

      #custom-openbracket,
      #custom-closebracket {
        margin: 0 5px;
      }

      /* idk what all this does */
      window#waybar {
        background-color: transparent;
        border-bottom: 0;
        color: @text;
        transition: background-color 0.5s;
      }

      window#waybar.hidden {
        opacity: 0.2;
      }

      window#waybar.empty #window {
        background-color: transparent;
      }


      /* configuring the modules */
      .modules-left {
        margin: 10px 0 0 10px;
        padding: 0 0 0 7px;
        background-color: @background;
        border: 2px solid @focused;
      }

      .modules-center {
        margin: 10px 0 0 0;
        padding: 0 10px 0 10px;
        background-color: @background;
        border: 2px solid @focused;
      }

      .modules-right {
        margin: 10px 10px 0 0;
        padding: 0 10px 0 10px;
        background-color: @background;
        border: 2px solid @focused;
      }


      /* whats this?? */
      button {
        border: none;
      }


      /* left island */

      /* menu pannel */
      #custom-arch,
      #custom-powerprofile,
      #custom-themeswitcher {
        padding-right: 10px;
        padding-left: 5px;
        font-size: 15px;
        border-radius: 8px;
      }

      #custom-arch:hover {
        color: @color1;
      }

      #custom-powerprofile:hover {
        color: @color1
      }

      #custom-themeswitcher:hover {
        color: @color1;
      }

      /* workspace pannel */
      #workspaces button {
        min-width: 0;
        padding: 0 8px 0 8px;
        background-color: transparent;
        color: @text;
        border-radius: 0;
      }

      #workspaces button:hover {
        background-color: @second-background;
      }

      #workspaces button.active {
        color: @focused2;
        background-color: @second-background;
      }

      #workspaces button.urgent {
        background-color: @urgent;
      }

      /* no idea what this does */
      .modules-left>widget:first-child>#workspaces {
        margin-left: 0;
      }

      .modules-right>widget:last-child>#workspaces {
        margin-right: 0;
      }

      /* media player */
      #mpris {
        margin: 0 0 0 5px;
        padding: 0 9px;
        background-color: @background;
        color: @text;
      }

      #mpris.playing {
        background-color: @focused;
        border-radius: 2px;
        color: @background;
      }


      /* center module  */
      #window {
        padding: 0 5px;
      }

      /* Right Island */

      /* module general styles */
      #clock,
      #battery,
      #cpu,
      #memory,
      #custom-clipboard,
      #custom-bluetooth,
      #network {
        padding: 0 10px;
      }

      #clock:hover,
      #battery:hover,
      #custom-cpu:hover,
      #custom-clipboard:hover,
      #custom-bluetooth:hover,
      #network:hover,
      #idle_inhibitor:hover,
      #custom-swaync:hover,
      #backlight:hover,
      #wireplumber:hover {
        color: @color1;
      }

      #idle_inhibitor {
        padding: 0 10px 0 0;
      }

      #custom-powerprofile {
        padding: 0 8px 0 4px;
      }

      /* Remaining Modules */
      #backlight,
      #wireplumber {
        padding: 0 5px;
      }

      #wireplumber.muted {
        background-color: @color2;
      }

      #custom-swaync {
        padding: 0 10px 0 5px;
        font-size: 16px;
        /* same scale as other icons */
        color: @text;
      }

      #battery.charging,
      #battery.plugged {
        background-color: @focused2 ;
        color: @background;
      }

      #battery.critical:not(.charging) {
        background-color: @urgent;
        color: @text;
        animation: blink 0.5s steps(12) infinite alternate;
      }

      @keyframes blink {
        to {
          background-color: @second-background;
          color: @text;
        }
      }

      #custom-cava {
        color: @focused;
        letter-spacing: 4px;
      }
    '';
    xdg.configFile."rofi/config.rasi".text = ''
      * {
          bg:    ${colors.bg};
          bg-alt: ${colors.bg-alt};
          fg:    ${colors.fg};
          fg-alt: ${colors.bright0};
          accent: ${colors.accent};
          urgent: ${colors.urgent};
          background-color: transparent;
          text-color: ${colors.fg};
      }
      window {
          width: 600px;
          background-color: @bg;
          border: 2px;
          border-color: @accent;
          border-radius: 10px;
          padding: 20px;
      }
      inputbar {
          children: [prompt, entry];
          background-color: @bg-alt;
          border-radius: 8px;
          padding: 10px;
          margin: 0 0 10px 0;
      }
      prompt {
          text-color: @accent;
          margin: 0 10px 0 0;
      }
      entry {
          placeholder: "Search...";
          placeholder-color: @fg-alt;
      }
      listview {
          lines: 8;
          spacing: 5px;
      }
      element {
          padding: 8px 12px;
          border-radius: 6px;
      }
      element selected {
          background-color: @accent;
          text-color: @bg;
      }
    '';
  };
}
