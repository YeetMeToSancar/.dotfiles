{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "gorkem";
  home.homeDirectory = "/home/gorkem";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.
  
    # Enable GPG
    programs.gpg.enable = true;

    # Enable and configure gpg-agent
    services.gpg-agent = {
      enable = true;
      pinentry.package = pkgs.pinentry-curses;
      pinentry.program = "pinentry-curses";
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # hello
    kitty
    git
    git-crypt
    gnupg
    thunderbird
    pinentry-curses
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/kitty/kitty.conf". text = ''
       # vim:ft=kitty
       ## name: Nord
       ## author: Eric N. Vander Weele
       ## upstream: https://www.nordtheme.com/
       ## blurb: Nord theme utilizing the full Frost and Aurora palette.

       # Basic colors
       foreground           #d8dee9
       background           #2e3440
       selection_foreground #d8dee9
       selection_background #434c5e

       # Cursor colors
       cursor            #d8dee9
       cursor_text_color #3b4252

       # URL underline color when hovering with mouse
       url_color #0087bd

       # Window border colors and terminal bell colors
       active_border_color   #81a1c1
       inactive_border_color #4c566a
       bell_border_color     #88c0d0
       visual_bell_color     none

       # Tab bar colors
       active_tab_foreground   #3b4252
       active_tab_background   #88c0d0
       inactive_tab_foreground #e5e9f0
       inactive_tab_background #4c566a
       tab_bar_background      #3b4252
       tab_bar_margin_color    none

       # Mark colors (marked text in the terminal)
       mark1_foreground #3b4252
       mark1_background #88c0d0
       mark2_foreground #3b4252
       mark2_background #bf616a
       mark3_foreground #3b4252
       mark3_background #ebcb8b

       # The basic 16 colors
       # black
       color0 #3b4252
       color8 #4c566a

       # red
       color1 #bf616a
       color9 #bf616a

       # green
       color2  #a3be8c
       color10 #a3be8c

       # yellow
       color3  #ebcb8b
       color11 #d08770

       # blue
       color4  #81a1c1
       color12 #5e81ac

       # magenta
       color5  #b48ead
       color13 #b48ead

       # cyan
       color6  #88c0d0
       color14 #8fbcbb

       # white
       color7  #e5e9f0
       color15 #eceff4
    '';
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
  #  /etc/profiles/per-user/gorkem/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
