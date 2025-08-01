{ config, pkgs, ... }:

{
  home.username = "knuspii";
  home.homeDirectory = "/home/knuspii";

  home.stateVersion = "23.11";

  programs.bash.enable = true;
  programs.kitty.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    settings = {
      monitor = ",preferred,auto,1";
      exec-once = "kitty";

      input = {
        kb_layout = "us";
        follow_mouse = 1;
      };

      general = {
        border_size = 2;
        gaps_in = 5;
        gaps_out = 20;
        "col.active_border" = "rgba(d79921ff)";
        "col.inactive_border" = "rgba(282828ff)";
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        blur = true;
        blur_size = 5;
        blur_passes = 3;
        blur_new_optimizations = true;
      };

      animations = {
        enabled = true;
        bezier = "easeOutCubic, 0.215, 0.61, 0.355, 1.0";
        animation = [
          "windows, 1, 7, easeOutCubic"
          "fade, 1, 10, easeOutCubic"
          "workspaces, 1, 6, easeOutCubic"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      misc = {
        disable_hyprland_logo = true;
      };
    };
  };

  home.packages = with pkgs; [
    gruvbox-dark-gtk
    papirus-icon-theme
  ];
}
