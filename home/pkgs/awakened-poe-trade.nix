{ pkgs ? import <nixpkgs> {} } :

let

	desktop = pkgs.makeDesktopItem {
		name = "Awakened Poe Trade";
		icon = "awakened-poe-trade";
		exec = "awakened-poe-trade %U";
		categories = [ "application" ];
		desktopName = "Awakened PoE Trade";
		startupWMClass = "awakened-poe-trade";
	};

in

pkgs.appimageTools.wrapType2 {
	name = "awakened-poe-trade";
	version = "v3.25.101";
	src = pkgs.fetchurl {
		url = "https://github.com/SnosMe/awakened-poe-trade/releases/download/v3.25.101/Awakened-PoE-Trade-3.25.101.AppImage";
		sha256 = "sha256-n/lv+sA9f0IeQ9ntgzemEAzO9GMN08u/GXqPAzmiqK4=";
	};
}
