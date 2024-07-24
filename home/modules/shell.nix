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

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/.zsh/history";

    oh-my-zsh.plugins = [ "git" ];
    oh-my-zsh.enable = true;
  
  };

  programs.starship.enableZshIntegration = true;
  programs.starship.enable = true;
  programs.starship.settings = {
    format = " $os$directory$git_branch$package$rust\n $character";

    character.success_symbol = " [󱞩](bold green)";
    charact.error_symbol = " [󱞩](bold red)";

    os.disabled = false;
    os.symbols.NixOS = "  ";
  };
}
