{ ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "small";
        padding = {
          top = 1;
          left = 2;
          right = 2;
        };
      };
      display = {
        separator = "  ";
        color = {
          separator = 90;
        };
      };
      modules = [
        {
          type = "title";
          format = "";
          key = " ";
          keyColor = "blue";
        }
        {
          type = "custom";
          format = "──────────────────────────";
        }
        {
          type = "os";
          key = "  OS";
          keyColor = "blue";
        }
        {
          type = "kernel";
          key = "  Kernel";
          keyColor = "blue";
        }
        {
          type = "packages";
          key = "  Pkgs";
          keyColor = "blue";
        }
        {
          type = "shell";
          key = "  Shell";
          keyColor = "cyan";
        }
        {
          type = "terminal";
          key = "  Term";
          keyColor = "cyan";
        }
        {
          type = "wm";
          key = "  WM";
          keyColor = "cyan";
        }
        {
          type = "custom";
          format = "";
        }
        {
          type = "cpu";
          key = " 󰻠 CPU";
          keyColor = "green";
        }
        {
          type = "gpu";
          key = " 󰍛 GPU";
          keyColor = "green";
        }
        {
          type = "memory";
          key = "  RAM";
          keyColor = "green";
        }
        {
          type = "disk";
          key = " 󰋊 Disk";
          keyColor = "green";
          folders = "/";
        }
        {
          type = "custom";
          format = "";
        }
        {
          type = "display";
          key = " 󰍹 Display";
          keyColor = "magenta";
        }
        {
          type = "uptime";
          key = "  Uptime";
          keyColor = "magenta";
        }
        {
          type = "custom";
          format = "";
        }
        {
          type = "colors";
          paddingLeft = 3;
          symbol = "circle";
        }

      ];
    };
  };
}
