{ config, ... }:
{
  sops = {
    age.keyFile = "/home/yoko/.config/sops/age/keys.txt";
    defaultSopsFile = ../secrets.yaml;

    secrets.reality_public = { };
    secrets.hysteria_password = { };
    secrets.obfs_password = { };

    templates."sing-box.json" = {
      owner = "sing-box";
      group = "sing-box";

      content = builtins.toJSON {
        log = {
          level = "info";
          timestamp = true;
        };
        dns = {
          servers = [
            {
              type = "udp";
              tag = "proxy-dns";
              server = "8.8.8.8";
              server_port = 53;
            }
            {
              type = "udp";
              tag = "direct-dns";
              server = "77.88.8.8";
              server_port = 53;
            }
            {
              type = "local";
              tag = "local";
            }
          ];
          rules = [
            {
              domain = [ "hy.yokoshima.ru" ];
              server = "direct-dns";
            }
            {
              domain_suffix = [
                ".ru"
                ".su"
              ];
              server = "direct-dns";
            }
          ];
          strategy = "prefer_ipv4";
        };
        inbounds = [
          {
            type = "tun";
            tag = "tun-in";
            mtu = 1280;
            address = [ "172.19.0.1/30" ];
            auto_route = true;
            strict_route = true;
            stack = "system";
          }
        ];
        outbounds = [
          {
            type = "selector";
            tag = "proxy";
            outbounds = [
              "auto"
              "vless-reality"
              "hy2"
            ];
            default = "hy2";
          }
          {
            type = "urltest";
            tag = "auto";
            outbounds = [
              "vless-reality"
              "hy2"
            ];
            url = "https://www.gstatic.com/generate_204";
            interval = "5m";
            tolerance = 50;
          }
          {
            type = "vless";
            tag = "vless-reality";
            server = "89.124.76.238";
            server_port = 443;
            uuid = "27acc49a-1fd5-4bb1-b164-77c2416293bc";
            flow = "xtls-rprx-vision";
            tls = {
              enabled = true;
              server_name = "www.microsoft.com";
              utls = {
                enabled = true;
                fingerprint = "chrome";
              };
              reality = {
                enabled = true;
                public_key = config.sops.placeholder.reality_public;
                short_id = "fe";
              };
            };
          }
          {
            type = "hysteria2";
            tag = "hy2";
            server = "hy.yokoshima.ru";
            server_port = 36712;
            password = config.sops.placeholder.hysteria_password;
            obfs = {
              type = "salamander";
              password = config.sops.placeholder.obfs_password;
            };
            tls = {
              enabled = true;
              server_name = "hy.yokoshima.ru";
            };
          }
          {
            type = "direct";
            tag = "direct";
          }
        ];
        route = {
          rules = [
            { action = "sniff"; }
            {
              protocol = "dns";
              action = "hijack-dns";
            }
            {
              ip_is_private = true;
              outbound = "direct";
            }
            {
              domain_suffix = [
                ".ru"
                ".su"
                ".yandex.com"
                ".vk.com"
                ".mail.ru"
                ".gosuslugi.ru"
                ".sberbank.ru"
                "reddit.com"
                "google.com"
              ];
              outbound = "direct";
            }
          ];
          final = "proxy";
          auto_detect_interface = true;
          default_domain_resolver = "local";
        };
      };
    };
  };
}
