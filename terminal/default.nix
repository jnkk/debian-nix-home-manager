{ pkgs, ... }:
{

	# programs.zsh = {
	# 	enable = true;
	# 	enableCompletion = true;
	# 	oh-my-zsh = {
	# 		enable = true;
	# 		plugins = ["eza" "direnv" ];
	# 		theme = "";
	# 	};
	# };
	
	programs.nushell = {
		enable = true;
	};

	programs.carapace.enable = true;
	programs.carapace.enableNushellIntegration = true;

}
