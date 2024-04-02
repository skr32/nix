{ config, pkgs, ... }: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    "${builtins.fetchTarball "https://github.com/nix-community/disko/archive/master.tar.gz"}/module.nix"
   ./disko-config.nix
  ];

  boot.loader.systemd-boot.enable = true; # (for UEFI systems only)

  # Enable the OpenSSH server.
  services.sshd.enable = true;

  users.users.skr = {
  isNormalUser = true;
  home = "/home/skr";
  extraGroups = [ "wheel" "networkmanager" ];
  openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCfK62nDTtWKBp6cpoRKVqOzFVFOchdmGo6cyqQVghes9iU6WxkxlE1ScVN4g2ELFoOSt8/sj8kaKTXfWv7D62jvmuSXiJb3MD1ie/vTgaB2zJQ0v/0yzd4kG8GqQUwk8PUK2nosYsH7WJrOOw5bITUFindhCbI9WhFX+FEJWsxWBo5UJLrz79T1fuUE940cw0KtI64aC7iy8n88bxTSt5mk3xYFvLvPaOJ1FPsUjY23xH21aRI2z2Ls5oiHt7Ox+LzQG0IJjckyzIl6ut2Yxa3WDR7iuIWgY96SI9ZkF4xh+Q9hgu+jsEAnQFnD7Tul7hmI/o+SrkDCI8qYAe/hoFrtMJhmf3KvJj+s+9J9mAVeF/7A9OT0/eB92HSzeeCmEZgiCPLkezeEZ2TynUa4zS7MOGwhMt8WJGsYKZRN3PdAGV06IJPlv76XfMWkL3ZTuweVumrdmZbcswJpeXBTzBG9szYLWn00nbEgHepTrLDzW3lJVz+xdKS80/AArLFSDk=" ];

};

}