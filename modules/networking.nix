{
  config,
  lib,
  pkgs,
  ...
}:
{
  networking.networkmanager.enable = true;
  networking.hostName = "nixos";
  networking.firewall.enable = false;

  services.sing-box = {
    enable = true;
    settings = {
      route.final = "direct";
    };
  };

  systemd.services.sing-box.serviceConfig = {
    AmbientCapabilities = [
      "CAP_NET_ADMIN"
      "CAP_NET_BIND_SERVICE"
      "CAP_NET_RAW"
    ];
    ExecStartPre = lib.mkForce [
      "+${pkgs.writeShellScript "sing-box-sops-pre" ''
        cp ${config.sops.templates."sing-box.json".path} /run/sing-box/config.json
        chown sing-box:sing-box /run/sing-box/config.json
      ''}"
    ];
  };
}
