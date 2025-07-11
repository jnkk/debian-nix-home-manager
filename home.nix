{ config, pkgs, ... }:

{

  imports = [
    ./direnv.nix
    # ./nixvim/default.nix
    # ./apps/nil.nix
    # ./terminal/nushell.nix
    # ./githubz/default.nix
    # ./tmux/default.nix
    # ./apps/alejandra.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "jnkk";
  home.homeDirectory = "/home/jnkk";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.

  # services.fstrim = {
  #   enable = true;
  #   interval = "weekly";
  # };

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [

    # cli/tui
    fzf
    eza
    ripgrep
    lsd
    bat
    fastfetch
    uv
    lazygit
    just
    fd
    jq
    zoxide
    lazydocker
    fast-cli

    # editors
    helix
    neovim # moving neovim to home-manager

    # still don't know what is this for
    nix-prefetch-scripts
    nurl
    nil
    alejandra
    nixd

    # development
    ihp-new
    nodejs-slim
    go
    zig
    mise
    direnv
    devenv

    # haskell
    spago
    purescript

    # javascripts
    # bun
    # deno
    # pnpm

    # fonts
    open-sans
    nerd-fonts.noto
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term
    nerd-fonts.iosevka-term-slab
    nerd-fonts.symbols-only
    nerd-fonts.blex-mono
    nerd-fonts.gohufont
    nerd-fonts.terminess-ttf
    nerd-fonts.sauce-code-pro
    nerd-fonts.droid-sans-mono

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # make sure the fonts are system-wide
  fonts.fontconfig.enable = true;

  programs.chromium.enable = true;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/jnkk/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
