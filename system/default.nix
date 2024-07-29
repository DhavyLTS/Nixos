{ pkgs, vars, ... } : {
	imports = [
		./core/network.nix ./core/display.nix
		./core/audio.nix ./core/users.nix
		./windows/${vars.flavor}.nix
		./hardware.nix
	];

	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	nixpkgs.config.allowUnfree = true;

	powerManagement.cpuFreqGovernor = "performance";
	console.keyMap = "${vars.console_keymap}";
	time.timeZone = "${vars.timezone}";

	programs.steam.gamescopeSession.enable = true;
	programs.gamemode.enable = true;
	programs.steam.enable = true;

	programs.nh.enable = true;

	environment.systemPackages = with pkgs; [
		gcc git lutris wine wine64 vulkan-tools
		winetricks vulkan-loader vulkan-headers
		cargo rustc clippy rustup protonup
		protontricks
	];

	system.stateVersion = "${vars.state_version}";
	i18n.defaultLocale = "${vars.default_locale}";

	boot.loader.efi.canTouchEfiVariables = true;
	boot.loader.systemd-boot.enable = true;

}
