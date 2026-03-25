{ ... }:

{
  flake.modules.nixos.sdu =
    { ... }:
    {
      age.secrets.eduroam.file = "../../secrets/eduroam.age";

      networking.networkmanager.ensureProfiles.profiles = {
        eduroam = {
          connection = {
            id = "eduroam";
            type = "wifi";
            interface-name = "wlp192s0"; ## replace with your interface-name as displayed by "ip a"
          };
          wifi = {
            mode = "infrastructure";
            ssid = "eduroam";
          };
          wifi-security = {
            key-mgmt = "wpa-eap"; ## adapt according to your universities setup
          };
          "802-1x" = { ## not all or even some additional values may be needed here according to your institution
            eap = "tls"; ## adapt according to your universities setup
            identity = "likely-youremail@youruniversity.edu";
            client-cert = "/etc/ssl/certs/eduroam/cert.pem";
            private-key = "/etc/ssl/certs/eduroam/private.key";
            private-key-password = "p@ssw0rd-of-your-.key-file"; ## warning, this should only be done for testing purposes, as it makes the password world-readable. You should replace this with some form of secrets-management using sops-nix or agenix.
            ca-cert = "/etc/ssl/certs/certs.pem";
          };
          ipv4 = {
            method = "auto";
          };
          ipv6 = {
            method = "auto";
          };
        };
      };
    };
}