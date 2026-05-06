{ pkgs, config, ... }:

{
  home.username = "sfaye";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    htop
    jq
    fd
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
  home.file.".config/alacritty".source = config.lib.file.mkOutOfStoreSymlink /Users/sfaye/.config/alacritty/alacritty.toml;
  home.file.".vimrc".source = config.lib.file.mkOutOfStoreSymlink /Users/sfaye/.vimrc;
  home.file.".config/kitty" = {
    source = config.lib.file.mkOutOfStoreSymlink .config/kitty;
    recursive = true;
  };
  home.file."Notes" = {
    source =  config.lib.file.mkOutOfStoreSymlink /Users/sfaye/Notes;
    recursive = true;
  };
}
