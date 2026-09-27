{config, ...}: {
  services.swayosd.enable = true;
  xdg.configFile."swayosd/style.css".source = config.lib.file.mkOutOfStoreSymlink ./swayosd/style.css;
}
