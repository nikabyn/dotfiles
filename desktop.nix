{
  pkgs,
  config,
  ...
}: let
  cursorName = "capitaine-cursors-white";
  cursorPackage = pkgs.capitaine-cursors;
  cursorSize = 32;
in {
  imports = [
    ./desktop/swayosd.nix
    ./desktop/vicinae.nix
    ./desktop/easyeffects.nix
  ];

  home.packages = with pkgs; [
    # Core Dependencies
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    xwayland-satellite
    xdg-utils
    glib
    libinput
    playerctl
    brightnessctl

    # Themes
    adwaita-icon-theme
    libadwaita
    adw-gtk3

    # Cursor Theme
    cursorPackage

    # Fonts
    adwaita-fonts
    nerd-fonts.fira-code
    noto-fonts
    noto-fonts-cjk-sans

    # nirimod
    niri
    awww
    swayosd
  ];

  # XDG Desktop Portals
  xdg = {
    enable = true;
    portal = {
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
  };

  # Niri
  xdg.configFile."niri/config.kdl".source = config.lib.file.mkOutOfStoreSymlink ./desktop/niri/config.kdl;
  home.activation.validateNiriConfig = config.lib.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.niri}/bin/niri validate
  '';

  # Themes
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
  home.sessionVariables = {
    # TODO Use https://github.com/kossLAN/qtengine as the theme and generate the proper color theme
    QT_QPA_PLATFORMTHEME = "xdgdesktopportal";
  };

  # Cursor Theme
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = cursorName;
    package = cursorPackage;
    size = cursorSize;
  };
  home.sessionVariables = {
    XCURSOR_THEME = cursorName;
    XCURSOR_SIZE = toString cursorSize;
  };
  gtk.cursorTheme = {
    name = cursorName;
    package = cursorPackage;
    size = cursorSize;
  };

  # Fonts
  fonts.fontconfig = {
    enable = true;

    defaultFonts = {
      sansSerif = ["Adwaita Sans" "Noto Sans"];
      serif = ["Noto Serif"];
      monospace = ["FiraCode Nerd Font Mono" "Adwaita Mono" "Noto Sans Mono"];
      emoji = ["Noto Color Emoji"];
    };
  };
}
