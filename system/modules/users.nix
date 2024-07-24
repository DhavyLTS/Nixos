{ ... } : {

	security.sudo.extraRules = [{
		commands = [{ command = "ALL"; options = [ "NOPASSWD" ]; }];
		users = [ "tanikaze" ];
	}];

	users.users."tanikaze" = {
    extraGroups = [ "networkmanager" "wheel" ];
    description = "tanikaze";
    isNormalUser = true;
  };

	users.groups.uinput.members = ["tanikaze"];
	users.groups.input.members = ["tanikaze"];
	hardware.uinput.enable = true;

	security.polkit.enable = true;
}
