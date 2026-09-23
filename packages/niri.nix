{ config, pkgs, ... }: {
  xdg.configFile."niri/config.kdl".source = config.lib.file.mkOutOfStoreSymlink ./niri/config.kdl;

  home.activation.validateNiriConfig =
      config.lib.dag.entryAfter [ "writeBoundary" ] ''
        ${pkgs.niri}/bin/niri validate
      '';
}
