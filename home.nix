{pkgs, ...}: {
  home.username = "nika";
  home.homeDirectory = "/home/nika";

  imports = [
    ./packages/niri.nix
    ./packages/easyeffects.nix
    ./packages/vicinae.nix
    ./packages/zed.nix
  ];

  home.packages = with pkgs; [
    # Applications
    ghostty
    firefox
    easyeffects
    nautilus

    # Dektop Components
    gnome-keyring
    xdg-desktop-portal-gnome
    xwayland-satellite
    gtk4
    libadwaita

    # nirimod
    niri
    waybar
    awww

    # Ui Customisation
    capitaine-cursors
    nerd-fonts.fira-code

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

  services.gnome.gnome-keyring.enable = true;
  programs.waybar.enable = true;

  # Cursor Theme
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "capitaine-cursors-white";
    package = pkgs.capitaine-cursors;
    size = 32;
  };
  home.sessionVariables = {
    XCURSOR_THEME = "capitaine-cursors-white";
    XCURSOR_SIZE = "32";
  };
  gtk = {
    enable = true;
    cursorTheme = {
      name = "capitaine-cursors-white";
      package = pkgs.capitaine-cursors;
      size = 32;
    };
  };

  fonts.fontconfig.enable = true;

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
    # EDITOR = "emacs";
  };

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
