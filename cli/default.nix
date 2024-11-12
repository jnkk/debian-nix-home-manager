{ pkgs, ... }:
{

	programs.zsh = {
		enable = true;
		

		oh-my-zsh = {
			enable = true;
			plugins = [ eza bat ];
			theme = "guezwhoz";
		};
	};
	
}
