{ config, ... }:

{
  sops.secrets = {
    sdu-email = {
      owner = config.users.users.karsten.name;
      inherit (config.users.users.karsten) group;
    };
    sdu-password = {
      owner = config.users.users.karsten.name;
      inherit (config.users.users.karsten) group;
    };
  };

  networking.wireless.networks.eduroam = {
    auth = ''
      ssid="eduroam"
      key_mgmt=WPA-EAP
      pairwise=CCMP
      group=CCMP TKIP
      eap=PEAP
      ca_cert="/home/karsten/.config/cat_installer/ca.pem"
      altsubject_match="DNS:adm01.aaa.sdu.dk"
      phase2="auth=MSCHAPV2"
      anonymous_identity="anonymous@sdu.dk"
      identity="${config.sops.secrets.sdu-email.path}"
      password="${config.sops.secrets.sdu-password.path}"
    '';
  };
}

# key_mgmt=WPA-EAP
# eap=PWD
