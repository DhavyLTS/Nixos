{ inputs, ... } : {
	imports = [ inputs.xremap.homeManagerModules.default ];
	services.xremap.watch = true;
	services.xremap.config.keymap = [{
		name = "default";
		remap.Alt-Shift-W = "Shift-7";
		remap.Capslock = "Esc";
		remap.Alt-D = "Right";
		remap.Alt-A = "Left";
		remap.Alt-S = "Down";
		remap.Alt-W = "Up";
	}];
}
