{pkgs, ...}: {
  home.username = "nika";
  home.homeDirectory = "/home/nika";

  imports = [
    ./packages/niri.nix
    ./packages/cursor.nix
    ./packages/swayosd.nix
    ./packages/vicinae.nix
    ./packages/zed.nix
    ./packages/easyeffects.nix
  ];

  home.packages = with pkgs; [
    # Applications
    nautilus
    mission-center
    firefox
    papers
    loupe
    showtime
    signal-desktop

    # Dektop Components
    # gnome-keyring
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    xdg-utils
    xwayland-satellite
    glib
    libinput

    # Adwaita
    libadwaita
    adwaita-fonts
    adw-gtk3
    adwaita-icon-theme

    # nirimod
    niri
    awww
    swayosd
    playerctl
    brightnessctl

    # Ui Customisation
    capitaine-cursors
    nerd-fonts.fira-code
    noto-fonts
    noto-fonts-cjk-sans

    # Development
    nixd # Nix LSP
    alejandra # Nix formatter

    # It is sometimes useful to fine-tune packages, for example, by applying
    # overrides. You can do that directly here, just don't forget the parentheses.
    # Maybe you want to install Nerd Fonts with a limited number of fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # You can also create simple shell scripts directly inside your configuration.
    (writeShellScriptBin "studnet"
      ''sshpass -f <(printf 'STPCTF1U\n') ssh 190031@139.18.143.253'')
    (writeShellScriptBin "connect"
      ''nmcli connection up Hotspot & studnet'')
  ];

  # Git
  programs.git = {
    enable = true;
    settings = {
      user.name = "Nika Sommer";
      user.email = "nika.sommer@proton.me";
      init.defaultBranch = "main";
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];

    config.niri = {
      default = ["gnome" "gtk"];
      "org.freedesktop.impl.portal.Settings" = ["gtk"];
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

  # Apply Adwaita as base theme
  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };
  qt = {
    enable = true;
  };

  programs.ghostty = {
    enable = true;
    settings = {
      theme = "dark:Catppuccin Mocha,light:Catppuccin Latte";
    };
  };

  fonts.fontconfig = {
    enable = true;

    defaultFonts = {
      sansSerif = ["Adwaita Sans" "Noto Sans"];
      serif = ["Noto Serif"];
      monospace = ["FiraCode Nerd Font Mono" "Adwaita Mono" "Noto Sans Mono"];
      emoji = ["Noto Color Emoji"];
    };
  };

  # Home Manager is pretty good at managing dotfiles.
  # The primary way to manage plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/nika/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # TODO Use https://github.com/kossLAN/qtengine as the theme and generate the proper color theme
    QT_QPA_PLATFORMTHEME = "xdgdesktopportal";
  };

  xdg.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "26.05"; # Please read the comment before changing.
}
