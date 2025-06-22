{ inputs, config, lib, ... }:
let
  cfg = config.custom.host.sops;
in
{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  options.custom.host.sops = {
    sopsFile = lib.mkOption {
      default = ../../../../secrets/secrets.yaml;
      description = ''
        Secrets file
      '';
    };
    sshKeyPaths = lib.mkOption {
      default = [ "/etc/ssh/ssh_host_ed25519_key" ];
      description = ''
        Hosts SSH key location
      '';
    };
    keyFile = lib.mkOption {
      default = "/var/lib/sops-nix/key.txt";
      description = ''
        New key location
      '';
    };
  };

  config.sops = {
    defaultSopsFile = cfg.sopsFile;
    validateSopsFiles = false;
    age = {
      sshKeyPaths = cfg.sshKeyPaths;
      keyFile = cfg.keyFile;
      generateKey = true;
    };
    secrets = {};
  };
}
