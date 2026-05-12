{ pkgs, config, ... }:

{
  home.username = "sfaye";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    htop
    jq
    fd
    git
    alacritty
  ];
### --- GIT --------------------------------------------------------- 
  programs.git = {
    enable = true;
#     let 
#       myKey = builtins.readFile /Users/sfaye/ssh/id_ed25519;
#     in 
#     {
     settings = {
       user = {
         name = "sfaye";
         username= "sashacantstop";
         email = "sasha.faye175@gmail.com";
       };
#       signing = {
#         signer = /Users/sfaye.openssh.authorizedKeys [ myKey ];
#         signByDefault = true;
#       };
#     };
     extraConfig = {
       init.defaultBranch = "main";
       pull.rebase        = true; 
     };
    };
  };

### --- FISH USER CONFIG --------------------------------------------
#  programs.fish = {
#    enable = true;
#  };

### --- KITTY CONF --------------------------------------------------
}
