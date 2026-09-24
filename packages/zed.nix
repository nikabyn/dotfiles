{...}: {
  programs.zed-editor = {
    enable = true;

    extensions = [
      "nix"
      "rust"
      "qml"
      "toml"
      "kdl"
      "html"
      "catppuccin"
      "catppuccin-icons"
    ];

    userSettings = {
      disable_ai = true;
      telemetry = {
        diagnostics = true;
        metrics = false;
      };

      ui_font_family = "Adwaita Sans";
      buffer_font_family = "FiraCode Nerd Font";
      ui_font_size = 15.0;
      buffer_font_size = 15;
      icon_theme = "Catppuccin Mocha";
      theme = {
        mode = "dark";
        light = "Catppuccin Latte";
        dark = "Catppuccin Mocha";
      };

      base_keymap = "VSCode";
      cli_default_open_behavior = "existing_window";

      languages = {
        Nix = {
          formatter = {
            external = {
              command = "alejandra";
              arguments = ["--quiet"];
            };
          };
          language_servers = ["nixd"];
        };
      };
    };
  };
}
