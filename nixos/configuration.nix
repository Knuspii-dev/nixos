{ config, pkgs, ... }:

{
  imports = [ ];

  system.stateVersion = "23.11";
  networking.hostName = "framework";

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.knuspii = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" ];
    shell = pkgs.bash;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = false; # nicht GNOME oder Plasma

  programs.git.enable = true;

  hardware.opengl.enable = true;
  services.hardware.opengl.driSupport = true;
  services.hardware.opengl.driSupport32Bit = true;

  services.printing.enable = true;
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    kitty
    firefox
    htop
    btop
    neofetch
    tree
    nmap
  ];

  system.autoUpgrade.enable = false;
}