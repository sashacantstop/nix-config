{ pkgs, ... }:

{
  home.username = "sfaye";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  # ------------------------------------------------------------------
  # GIT  
  # ------------------------------------------------------------------
  programs.git = {
    enable        = true;
    # userName    = "Sasha Faye";
    # userEmail   = "you@example.com";
    # signing.key = "";          # GPG or SSH key fingerprint
    # signing.signByDefault = true;
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase        = true; 
    };
  };

  # ------------------------------------------------------------------
  # FISH — user-level config
  # ------------------------------------------------------------------
  programs.fish = {
    enable = true;
    shellAbbrs = {
      ll  = "eza -lah";
      la  = "eza -a";
      lt  = "eza --tree";
      gs  = "git status";
      gp  = "git pull";
      gd  = "git diff";
      gl  = "git log --oneline --graph";
      nrs = "nixos-rebuild switch --flake ."; 
      drs = "darwin-rebuild switch --flake .";  
    };
    interactiveShellInit = ''
      # Suppress the default fish greeting.
      set fish_greeting ""
    '';
  };

  # ------------------------------------------------------------------
  # COMMON PACKAGES 
  # ------------------------------------------------------------------
  home.packages = with pkgs; [
    htop
    jq        
    fd
  ];
}
