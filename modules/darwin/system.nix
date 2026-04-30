{pkgs, self, ...}: 

{
  system.stateVersion = 6;
  system.configurationRevision = self.rev or self.dirtyRev or null;

  nixpkgs.hostPlatform = "x86_64-darwin";

  security.pam.services.sudo_local.touchIdAuth = true;
  security.pam.services.sudo_local.reattach = true;

  programs.fish.enable = true;
  programs.zsh.enable = true;   
  programs.nix-index.enable = true;
  programs.tmux.enable = true;
  programs.vim.enable = true;

  environment.systemPackages = with pkgs; [ 
    kitty kitty-themes alacritty
    yazi eza fzf ripgrep tree bat
    fastfetch htop darwin.top darwin.ps
    wget curl syncthing ookla-speedtest qbittorrent
    git gh nodejs rustup go python3 
    ollama chatgpt-cli 
    telegram-desktop spotify
    _1password-cli _1password-gui
    wikiman tor
  ];

  environment.variables = {
    TERM = "alacritty";
  };

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.dejavu-sans-mono
    nerd-fonts.hack
  ];

  documentation = {
    enable = true;
    doc.enable = true;
    info.enable = true;
    man.enable = true;
  };

  users.users.sfaye = {
    name = "sfaye";
    home = "/Users/sfaye";    
  };

  nix.package = pkgs.nix;
  nix.settings.trusted-users = [ "root" "sfaye" ];

  nix.gc = {
    automatic = true;
    options = "--delete-older-than 7d";
  };
}
