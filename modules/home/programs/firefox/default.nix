{ lib, pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;
    # profiles.karsten = {
    #   extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
    #     duckduckgo-privacy-essentials
    #     firefox-color
    #     markdownload
    #     react-devtools
    #     vimium
    #     zotero-connector
    #     ublock-origin
    #     proton-pass
    #     foxytab
    #     # languagetool
    #     auto-tab-discard
    #   ];
    #   settings = {
    #     "browser.shell.checkDefaultBrowser" = false;
    #     "browser.startup.homepage" = "https://search.nixos.org";
    #   };
    # };
    # nativeMessagingHosts.packages = [
    #   pkgs.plasma5Packages.plasma-browser-integration
    # ];
    # preferences = {
    #   "widget.use-xdg-desktop-portal.file-picker" = 1;
    # };
  };
}
