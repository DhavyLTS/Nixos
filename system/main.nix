{ ... } : {
  imports = [ ./hardware.nix ./modules/network.nix ./modules/users.nix ./modules/display.nix ];

	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	nixpkgs.config.allowUnfree = true;

  powerManagement.cpuFreqGovernor = "performance";
  time.timeZone = "America/Sao_Paulo";
	console.keyMap = "br-abnt2";

	i18n.defaultLocale = "en_US.UTF-8";
	i18n.extraLocaleSettings = {
		LC_IDENTIFICATION = "pt_BR.UTF-8";
		LC_MEASUREMENT = "pt_BR.UTF-8";
		LC_TELEPHONE = "pt_BR.UTF-8";
		LC_MONETARY = "pt_BR.UTF-8";
		LC_ADDRESS = "pt_BR.UTF-8";
		LC_NUMERIC = "pt_BR.UTF-8";
		LC_PAPER = "pt_BR.UTF-8";
		LC_NAME = "pt_BR.UTF-8";
		LC_TIME = "pt_BR.UTF-8";
	};

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;

  system.stateVersion = "24.11";
}

