{ ... }:
{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.blueman.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };
  services.pipewire.wireplumber.extraConfig = {
    "bluetooth.properties" = {
      "bluez5.codecs" = [
        "sbc"
        "sbc_xq"
        "aac"
        "ldac"
        "aptx"
        "aptx_hd"
      ];
    };
  };
}
