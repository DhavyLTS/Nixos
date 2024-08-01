{ pkgs, vars, inputs, ... } :

let

	awakened-poe-trade = ( import ./pkgs/awakened-poe-trade.nix { inherit pkgs; } );

in

{
	imports = [
		./flavor/${vars.flavor}/main.nix
		./core/neovim.nix
		./core/xremap.nix
		./core/shell.nix
		./core/kitty.nix
		./core/style.nix
	];

	nixpkgs.config.allowUnfree = true;

	xdg.desktopEntries = {
		awakened-poe-trade = {
			name = "Awakened Poe Trade";
			exec = "awakened-poe-trade";
			categories = [ "Application" ];
			terminal = false;
		};
	};

	home.homeDirectory = "/home/${vars.username}";
	home.stateVersion = "${vars.state_version}";
	home.username = "${vars.username}";

	home.packages = with pkgs; [
		yazi spotify-tray stremio path-of-building
		lutris lazygit vesktop deluge-gtk
		wine winetricks gimp
	] ++ [ awakened-poe-trade ];

	home.sessionVariables = {
		STEAM_EXTRA_COMPAT_TOOLS_PATH = "\${HOME}/.steam/root/compatibility.d";
		LD_LIBRARY_PATH="${pkgs.nix-ld}/lib:$LD_LIBRARY_PATH";
	};

	programs = {
		home-manager.enable = true;
		firefox.enable = true;
		lazygit.enable = true;
		btop.enable = true;
		yazi.enable = true;
	};
}
