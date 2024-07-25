{ pkgs, config, ... } : {
	programs.zsh = {
		syntaxHighlighting.enable = true;
		autosuggestion.enable = true;
		enableCompletion = true;
		enable = true;

		shellAliases = {
			system = "FLAKE=~/nixos nh os";
			home = "FLAKE=~/nixos nh home";
			vim = "${pkgs.neovim}/bin/nvim";
			vi = "${pkgs.neovim}/bin/nvim";
			ls = "${pkgs.eza}/bin/eza";
		};

		history.path = "${config.xdg.dataHome}/.zsh/history";
		history.size = 10000;

		oh-my-zsh.plugins = [ "git" ];
		oh-my-zsh.enable = true;

	};

	programs.starship.enableZshIntegration = true;
	programs.starship.enable = true;
	programs.starship.settings = {
		format = " $os$directory$git_branch$package$rust$fill$time \n $character";
		add_newline = true;

		character.success_symbol = " [󱞩](bold green)";
		character.error_symbol = " [󱞩](bold red)";

		fill.symbol = " ";

		os.disabled = false;
		os.symbols.NixOS = " ";

		time.disabled = false;
		time.format = "[  ](bold yellow)[$time](bold white)";
	};
}
