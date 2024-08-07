{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
	name = "gruvbox-plus";

	phases = ["installPhase"];

	buildInputs = [ pkgs.unzip ];

	src = pkgs.fetchurl {
		url = "https://github.com/SylEleuth/gruvbox-plus-icon-pack/releases/download/v5.5.0/gruvbox-plus-icon-pack-5.5.0.zip";
		sha256 = "0R584wmN342Z4gXK5GOao4hR+jwOhSSLndgUx2zOMmE=";
	};

	installPhase = ''
		mkdir -p $out/share/icons
		unzip $src -d $out/share/icons
	'';
}
