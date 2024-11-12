{ pkgs, ... }:
{

	programs.zsh = {
		enable = true;
		autosuggestions.enable = true;
		histSize = 10000;

		ohMyZsh = {
			enable = true;
			theme = "";
		};
	};
	
}
