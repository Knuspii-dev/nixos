{ config, pkgs, ... }:

{
  home.username = "knuspii";
  home.homeDirectory = "/home/knuspii";

  # Kitty Terminal Config
  programs.kitty.enable = true;
  programs.kitty.settings = {
    font_family = "Cascadia Code PL";
    font_size = 12;
    background_opacity = "0.9";
    cursor_shape = "block";
  };

  # Additional User Packages
  home.packages = with pkgs; [
    kitty
    firefox
    neofetch
    htop
    btop
    tree
    openssh
    nmap
  ];
}
