{
  config,
  pkgs,
  ...
}: {
  home.packages = [pkgs.easyeffects];
  xdg.dataFile."easyeffects/output/framework.json".source = config.lib.file.mkOutOfStoreSymlink ./easyeffects/framework.json;

  systemd.user.services.easyeffects = {
    Unit = {
      Description = "EasyEffects audio processing service";
      After = [
        "niri.service"
        "pipewire.service"
      ];
      PartOf = ["niri.service"];
    };

    Service = {
      ExecStart = "${pkgs.easyeffects}/bin/easyeffects --hide-window --service-mode";
      Restart = "on-failure";
      Environment = ["QT_QPA_PLATFORM=wayland"];
    };

    Install = {
      WantedBy = ["niri.service"];
    };
  };
}
