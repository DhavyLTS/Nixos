{ config, lib, modulesPath, ... }:{

  imports = [ (modulesPath + "/installer/scan/not-detected.nix")];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
  boot.kernelModules = [ "kvm-intel" "v4l2loopback" ];
	boot.initrd.kernelModules = [ ];
  boot.extraModulePackages = [ ];
	boot.extraModprobeConfig = ''
		options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
	'';

  fileSystems."/" = {
		device = "/dev/disk/by-uuid/528031a3-d05b-4491-bb1b-7a56846bce07";
		fsType = "ext4";
  };

  fileSystems."/boot" = {
		device = "/dev/disk/by-uuid/FE44-5521";
		options = [ "fmask=0022" "dmask=0022" ];
		fsType = "vfat";
  };

  swapDevices = [ ];

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
