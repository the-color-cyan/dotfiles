{ config, pkgs, lib, ... }:

{
  imports = [
    "${
      builtins.fetchGit { url = "https://github.com/NixOS/nixos-hardware.git"; }
    }/dell/xps/15-7590/nvidia"
    "${
      builtins.fetchGit { url = "https://github.com/NixOS/nixos-hardware.git"; }
    }/dell/xps/sleep-resume/bluetooth"
    "${
      builtins.fetchGit { url = "https://github.com/NixOS/nixos-hardware.git"; }
    }/dell/xps/sleep-resume/i2c-designware"
  ];
  #   "${
  #   builtins.fetchGit { url = "https://github.com/NixOS/nixos-hardware.git"; }
  # }/common/gpu/nvidia/disable.nix"

  boot.kernelParams = [ "i915.enable_psr=0" "mem_sleep_default=s2idle" ];

  # boot.kernelParams =
  #   [ "i915.enable_dpcd_backlight=0" "acpi_backlight=nvidia_wmi_ec" ];

  # systemd.services.backlight-resume = {
  #   description =
  #     "set backlight brightness to maximum after resuming from suspend";
  #   wantedBy = [ "suspend.target" ];
  #   after = [ "suspend.target" ];
  #   serviceConfig = {
  #     Type = "oneshot";
  #     ExecStart = pkgs.writeShellScript "backlight-resume" ''
  #       ${pkgs.coreutils}/bin/sleep 3 && ${pkgs.coreutils}/bin/cat /sys/class/backlight/intel_backlight/max_brightness > /sys/class/backlight/intel_backlight/brightness
  #     '';
  #   };
  # };

  # # allow backlight control outside of sudo
  # systemd.services.backlight-permissions = {
  #   description = "set backlight permissions";
  #   wantedBy = [ "multi-user.target" ];
  #   after = [ "systemd-udev-settle.service" ];
  #   serviceConfig = {
  #     Type = "oneshot";
  #     ExecStart = pkgs.writeShellScript "backlight-permissions" ''
  #       ${pkgs.coreutils}/bin/chmod 664 /sys/class/backlight/intel_backlight/brightness
  #       ${pkgs.coreutils}/bin/chgrp video /sys/class/backlight/intel_backlight/brightness
  #     '';
  #   };
  # };

  # hardware.graphics = { enable = true; };
  #
  # # nvidia driver for wayland
  # services.xserver.videoDrivers = [ "modesetting" "nvidia" ];
  #
  # hardware.nvidia = {
  #   modesetting.enable = true;
  #
  #   open = true;
  #
  #   nvidiaSettings = true;
  #
  #   package = config.boot.kernelPackages.nvidiaPackages.stable;
  # };
  #
  # hardware.nvidia.prime = {
  #   offload = {
  #     enable = true;
  #     enableOffloadCmd = true;
  #   };
  # };
}
