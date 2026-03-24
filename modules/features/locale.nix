{ lib, config, ... }:

let
  timeZone = "Europe/Copenhagen";
  kbLocale = "en_DK.UTF-8";
  locale = "da_DK.UTF-8";
in
{
  flake.modules.nixos.locale = {
    time.timeZone = timeZone;
    i18n.defaultLocale = kbLocale;
    i18n.extraLocaleSettings = {
      LC_ADDRESS = locale;
      LC_IDENTIFICATION = locale;
      LC_MEASUREMENT = locale;
      LC_MONETARY = locale;
      LC_NAME = locale;
      LC_NUMERIC = locale;
      LC_PAPER = locale;
      LC_TELEPHONE = locale;
      LC_TIME = locale;
    };
  };
}
