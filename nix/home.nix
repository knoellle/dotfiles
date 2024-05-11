{ inputs, config, pkgs, ... }:

{
  home = {
    username = "mystery";
    packages = with pkgs; [ ];
  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    plugins = [
      inputs.hyprland-split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
      # inputs.hyprland-plugins.packages."${pkgs.system}".borders-plus-plus
    ];
    extraConfig = "source = /etc/nixos/hyprland.conf";
  };
}
