{ inputs, pkgs, ... } : {
	imports = [ inputs.stylix.homeManagerModules.stylix ];

	home.file.".config/hypr/wallpaper.png" = {
		source = ../wallpaper.png;
		recursive = true;
	};

	stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
	stylix.cursor.package = pkgs.apple-cursor;
	stylix.cursor.name = "macOS-BigSur-White";
	stylix.cursor.size = 16;

	stylix.image = ../wallpaper.png;
	stylix.polarity = "dark";
	stylix.enable = true;
}
