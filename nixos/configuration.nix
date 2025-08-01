{ config, pkgs, ... }:

{
  imports = [];

  # Disable X11, Enable Wayland
  services.xserver.enable = false;
  services.wayland.enable = true;

  # Hyprland stuff
  services.hyprland.enable = true;

  # System packages
  environment.systemPackages = with pkgs; [
    hyprland
    waybar
    mako
    swww
    kitty
    firefox
    neofetch
    htop
    btop
    tree
    openssh
    nmap
  ];

  # User config
  users.users.knuspii = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.bashInteractive;
  };

  system.stateVersion = "23.11";
}
