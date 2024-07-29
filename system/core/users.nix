{ vars, ... } : {

	security.sudo.extraRules = [{
		commands = [{ command = "ALL"; options = [ "NOPASSWD" ]; }];
		users = [ "${vars.username}" ];
	}];

	users.users."${vars.username}" = {
		extraGroups = [ "networkmanager" "wheel" ];
		description = "${vars.username}";
		isNormalUser = true;
	};

	users.groups.uinput.members = ["${vars.username}"];
	users.groups.input.members = ["${vars.username}"];
	hardware.uinput.enable = true;

	security.polkit.enable = true;
}
