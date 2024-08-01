{ pkgs, vars, ... } : {
	imports = [
		./wm/${vars.flavor}.nix
		./core/network.nix
		./core/display.nix
		./core/audio.nix
		./core/users.nix
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
	programs.adb.enable = true;

	programs.nh = {
		enable = true;
		clean.enable = true;
		clean.extraArgs = "--keep-since 4d --keep 3";
	};

  programs.nix-ld.enable = true;

	environment.systemPackages = with pkgs; [
		gcc git lutris wine wine64 vulkan-tools
		winetricks vulkan-loader vulkan-headers
		cargo rustc clippy rustup protonup
		protontricks v4l-utils droidcam
	];

	system.stateVersion = "${vars.state_version}";
	i18n.defaultLocale = "${vars.default_locale}";

	boot.loader.efi.canTouchEfiVariables = true;
	boot.loader.systemd-boot.enable = true;

	boot.binfmt.registrations.appimage = {
		wrapInterpreterInShell = false;
		interpreter = "${pkgs.appimage-run}/bin/appimage-run";
		mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
		magicOrExtension = ''\x7fELF....AI\x02'';
		recognitionType = "magic";
		offset = 0;
	};
}
