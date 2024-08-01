{ pkgs, ... } : let modifier = "Mod4"; in {

	imports = [ ./picom.nix ./polybar.nix ./startup.nix ./keymaps.nix ];

	programs.rofi.package = pkgs.rofi;
	programs.rofi.enable = true;
	programs.feh.enable = true;

	xsession.windowManager.i3.package = pkgs.i3-gaps;
	xsession.windowManager.i3.enable = true;
	xsession.windowManager.i3.config = {
		modifier = "${modifier}";
		gaps.inner = 10;
		gaps.outer = 6;
		bars = [];
	};

	xsession.windowManager.i3.extraConfig = ''
		for_window [class="steam_app*"] move container to workspace number 0
		
		for_window [class="steam_app_238960"] move position 0 px 117 px
		for_window [class="steam_app_238960"] resize set 1920 810
		for_window [class="steam_app_238960"] floating enable

		for_window [class="awakened-poe-trade"] move container to workspace number 0
		for_window [class="awakened-poe-trade"] floating enable

		default_floating_border pixel 2
		default_border pixel 2
	'';
}
