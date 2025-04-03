{ ... }:

{
  services = {
    openssh = {
      enable = true;
      ports = [ 22 ];
      settings = {
        PasswordAuthentication = false;
        AllowUsers = false;
        PermitRootLogin = "no";
      };
      openFirewall = true;
    };
  };
}
