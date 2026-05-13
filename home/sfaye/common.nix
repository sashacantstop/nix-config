# home/sfaye/common.nix

{ pkgs, ... }:

{
  home.username = "sfaye";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    htop jq fd ripgrep fzf bat eza tree
  ];

### --- GIT --------------------------------------------------------- 
  programs.git = {
    enable = true;
    userName = "sfaye";
    userEmail = "sasha.faye175@gmail.com";

    settings = {
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      fetch.prune = true;
    };
  };

### --- SHELLS ------------------------------------------------------
  programs.zsh.enable = true;
}
