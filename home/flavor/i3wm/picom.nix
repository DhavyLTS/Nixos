{ ... } : {
	services.picom.enable = true;
  services.picom = {
    fade = true;
		backend = "glx";
    activeOpacity = 1.0;
    inactiveOpacity = 1.0;
		settings.vsync = true;
		settings.fade-delta = 2;
		#settings.corner-radius = 10.0;
  };
}
