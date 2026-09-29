{pkgs, ...}: {
  home.packages = with pkgs; [
    nautilus
    mission-center
    papers
    loupe
    showtime
    video-trimmer
    signal-desktop
    firefox
  ];

  programs.ghostty = {
    enable = true;
    settings = {
      # TODO Combine Adwaita and Catppuccin Latte/Mocha colors
      theme = "light:Catppuccin Latte,dark:Catppuccin Mocha";
    };
  };

  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor-fhs;

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
      restore_on_startup = "last_workspace";

      # UI Layout
      title_bar = {
        show_sign_in = false;
        button_layout = "";
        show_user_menu = false;
      };
      project_panel.dock = "left";
      git_panel.dock = "left";
      search.button = false;
      toolbar = {
        agent_review = false;
        code_actions = false;
      };
      minimap = {
        thumb = "always";
        show = "always";
      };
      sticky_scroll.enabled = true;

      # UI Theme
      icon_theme = "Catppuccin Mocha";
      theme = {
        mode = "system";
        light = "Catppuccin Latte";
        dark = "Catppuccin Mocha";
      };

      # Font
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

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";

      # loupe
      "image/apng" = "org.gnome.Loupe.desktop";
      "image/bmp" = "org.gnome.Loupe.desktop";
      "image/gif" = "org.gnome.Loupe.desktop";
      "image/jp2" = "org.gnome.Loupe.desktop";
      "image/jpeg" = "org.gnome.Loupe.desktop";
      "image/png" = "org.gnome.Loupe.desktop";
      "image/qoi" = "org.gnome.Loupe.desktop";
      # "image/tiff" = "org.gnome.Loupe.desktop";
      "image/vnd.microsoft.icon" = "org.gnome.Loupe.desktop";
      "image/webp" = "org.gnome.Loupe.desktop";
      "image/x-dds" = "org.gnome.Loupe.desktop";
      "image/x-exr" = "org.gnome.Loupe.desktop";
      "image/x-portable-anymap" = "org.gnome.Loupe.desktop";
      "image/x-portable-bitmap" = "org.gnome.Loupe.desktop";
      "image/x-portable-graymap" = "org.gnome.Loupe.desktop";
      "image/x-portable-pixmap" = "org.gnome.Loupe.desktop";
      "image/x-qoi" = "org.gnome.Loupe.desktop";
      "image/x-tga" = "org.gnome.Loupe.desktop";
      "image/x-win-bitmap" = "org.gnome.Loupe.desktop";
      "image/x-xbitmap" = "org.gnome.Loupe.desktop";
      "image/x-xpixmap" = "org.gnome.Loupe.desktop";
      "image/svg+xml" = "org.gnome.Loupe.desktop";
      "image/svg+xml-compressed" = "org.gnome.Loupe.desktop";
      "image/avif" = "org.gnome.Loupe.desktop";
      "image/heic" = "org.gnome.Loupe.desktop";
      "image/jxl" = "org.gnome.Loupe.desktop";

      # papers
      "application/vnd.comicbook-rar" = "papers";
      "application/vnd.comicbook+zip" = "papers";
      "application/x-cb7" = "papers";
      "application/x-cbr" = "papers";
      "application/x-cbt" = "papers";
      "application/x-cbz" = "papers";
      "application/x-ext-cb7" = "papers";
      "application/x-ext-cbr" = "papers";
      "application/x-ext-cbt" = "papers";
      "application/x-ext-cbz" = "papers";
      "application/x-ext-djv" = "papers";
      "application/x-ext-djvu" = "papers";
      "image/vnd.djvu" = "papers";
      "image/vnd.djvu+multipage" = "papers";
      "application/pdf" = "papers";
      "application/x-bzpdf" = "papers";
      "application/x-ext-pdf" = "papers";
      "application/x-gzpdf" = "papers";
      "application/x-xzpdf" = "papers";
      "application/illustrator" = "papers";
      "image/tiff" = "papers";
    };
  };
}
