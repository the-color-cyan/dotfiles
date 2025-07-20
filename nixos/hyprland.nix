# hyprland nix config

{ config, pkgs, lib, ... }:

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  # hyprlock - also enables hypridle
  programs.hyprlock.enable = true;

  # screensharing
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
  };

  environment.systemPackages = with pkgs; [
    waybar
    kitty
    wofi
    dunst
    networkmanagerapplet
    wl-gammarelay-rs
    wl-clipboard
    hyprpaper
    wlopm
  ];
}
