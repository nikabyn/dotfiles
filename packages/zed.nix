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

      # UI Layout
      title_bar = {
        show_sign_in = false;
        button_layout = "";
        show_user_menu = false;
      };
      project_panel = {
        dock = "left";
      };
      toolbar = {
        agent_review = false;
        code_actions = false;
      };
      minimap = {
        thumb = "always";
        show = "always";
      };
      sticky_scroll = {
        enabled = true;
      };

      # UI Theme
      icon_theme = "Catppuccin Mocha";
      theme = {
        mode = "system";
        light = "Catppuccin Latte";
        dark = "Catppuccin Mocha";
      };

      # Font
      ui_font_size = 15.0;
      buffer_font_size = 15;
      ui_font_family = "Adwaita Sans";
      buffer_font_family = "FiraCode Nerd Font";

      base_keymap = "VSCode";
      cli_default_open_behavior = "existing_window";

      # Lanugage Servers
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
