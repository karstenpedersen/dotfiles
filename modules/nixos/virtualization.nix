{ pkgs, ... }:

{
  virtualisation = {
    containers.enable = true;
    docker.enable = true;
    podman = {
      enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };
    libvirtd = {
      enable = false;
      # qemu = {
      #   package = pkgs.qemu_kvm;
      #   runAsRoot = true;
      #   swtpm.enable = true;
      #   ovmf = {
      #     enable = true;
      #     packages = [(pkgs.OVMF.override {
      #       secureBoot = true;
      #       tpmSupport = true;
      #     }).fd];
      #   };
      # };
    };
    virtualbox.host.enable = true;
  };
  users.extraGroups.vboxusers.members = [ "karsten" ];
}
