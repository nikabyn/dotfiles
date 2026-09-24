{pkgs, ...}: let
  name = "capitaine-cursors-white";
  package = pkgs.capitaine-cursors;
  size = 32;
in {
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = name;
    package = package;
    size = size;
  };
  home.sessionVariables = {
    XCURSOR_THEME = name;
    XCURSOR_SIZE = toString size;
  };
  gtk.cursorTheme = {
    name = name;
    package = package;
    size = size;
  };
}
