{...}: {
  programs.vicinae = {
    enable = true;
    systemd.enable = true;
    settings = {
      search_files_in_root = true;

      close_on_focus_loss = true;
      consider_preedit = true;
      pop_to_root_on_close = true;

      favicon_service = "twenty";
      font = {
        normal = {
          size = 12;
          family = "Adwaita Sans";
        };
      };
      theme = {
        light = {
          name = "libadwaita-light";
          icon_theme = "Adwaita";
        };
        dark = {
          name = "libadwaita-dark";
          icon_theme = "Adwaita";
        };
      };
      launcher_window = {
        layer_shell.enabled = true;
        opacity = 0.80;
        compact_mode.enabled = true;
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
