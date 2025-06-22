{ vars, ... }:

{
  services = {
    openssh = {
      enable = true;
      ports = [ vars.sshPort ];
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
      openFirewall = true;

      hostKeys = [
        {
          path = "/etc/ssh/ssh_host_ed25519_key";
          type = "ed25519";
        }
      ];
    };
  };

  networking.firewall.allowedTCPPorts = [ vars.sshPort ];
}
