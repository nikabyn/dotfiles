{...}: {
  #  systemd.user.services.vicinae = {
  #    Unit = {
  #      Description = "Vicinae server";
  #      After = [ "niri.service" ];
  #      PartOf = [ "niri.service" ];
  #    };
  #
  #    Service = {
  #      ExecStart = "${pkgs.vicinae}/bin/vicinae server";
  #      Restart = "on-failure";
  #      Environment = ["USE_LAYER_SHELL=1"];
  #    };
  #
  #    Install = {
  #      WantedBy = ["niri.service"];
  #    };
  #  };

  programs.vicinae = {
    enable = true;
    settings = {
      close_on_focus_loss = true;
      consider_preedit = true;
      pop_to_root_on_close = true;
      favicon_service = "twenty";
      search_files_in_root = true;
      font = {
        normal = {
          size = 12;
          family = "Adwaita Sans";
        };
      };
      theme = {
        light = {
          name = "libadwaita-light";
          icon_theme = "default";
        };
        dark = {
          name = "libadwaita-dark";
          icon_theme = "default";
        };
      };
      launcher_window = {
        opacity = 0.75;
      };
    };
    #extensions = with inputs.vicinae-extensions.packages.${pkgs.stdenv.hostPlatform.system}; [
    #  bluetooth
    # nix
    #power-profile
    # Extension names can be found in the link below, it's just the folder names
    #];
  };
}
