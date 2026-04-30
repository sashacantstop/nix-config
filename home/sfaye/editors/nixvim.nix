{ pkgs, lib, ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

###  GLOBALS  ──────────────────────────────────────────────────────────
    globals = {
      mapleader = " ";
      maplocalleader = "\\"; 
    };

### PTS ──────────────────────────────────────────────────────────────
    opts = {
      number = true;
      relativenumber = true;
      autoread = true;
      termguicolors = true;
      list = true;
      laststatus = 2;

      expandtab = true;
      tabstop = 2;
      shiftwidth  = 2;
      softtabstop = 2;
      smartindent = true;
      autoindent = true;
      shiftround = true;
      copyindent = true;

      ruler = true;
      title = true;

      wrap = false;
      showmatch = true;
      cursorline = true;
      signcolumn = "yes";
      scrolloff = 20;
      sidescrolloff = 10;

      ignorecase = true;
      smartcase  = true;
      hlsearch   = false;
      incsearch  = true;

      splitbelow = true;
      splitright = true;

      undofile   = true;
      swapfile   = false;
      backup     = false;

      clipboard = "unnamedplus";
      updatetime = 200;
    };
    
### COLOURS ──────────────────────────────────────────────────────────
    colorschemes.tokyonight = {
      enable = true;
      settings = {
        style = "night";
        terminal_colors = true;
        transparent = true;
        styles = {
          comments = { italic = true; };
          keywords = { bold = true;  };
          sidebars = "dark";
          floats = "dark";
        };
      };
    };


### KEYMAPS ──────────────────────────────────────────────────────────
    keymaps = [
    ### TELESCOPE -----------------------------------------------------
      {
        mode = "n"; key = "<leader>ff"; action = "<cmd>Telescope find_files<cr>";
        options.desc = "Telescope Find File";
      }
      {
        mode = "n"; key = "<leader>fg"; action = "<cmd>Telescope live_grep<cr>";
        options.desc = "Tele Live Grep";
      }
      {
        mode = "n"; key = "<leader>w"; action = "<cmd>write<cr>";
        options.desc = "Write Buffer";
      }
      {
        mode = "n"; key = "<leader>q"; action = "<cmd>quit<cr>";
        options.desc = "Quite Window";
      }
      {
        mode = "n"; key = "<leader>cd"; action = "<cmd>Ex<cr>";
        options.desc = "Change Dir";
      }
      {
        mode = "n"; key = "<leader>vv"; action = "<cmd>vsplit<cr>";
        options.desc = "split v";
      }
      { 
        mode = "n"; key = "<leader>hh"; action = "<cmd>split<cr>"; 
        options.desc = "split h";
      }
      { 
        mode = "n"; key = "<leader>wq"; action = "<cmd>write<cr><cmd>quit<cr>"; 
        options.desc = "write and quit"; 
      }
      { mode = "n"; key = "<C-h>"; action = "<C-w>h"; }
      { mode = "n"; key = "<C-j>"; action = "<C-w>j"; }
      { mode = "n"; key = "<C-k>"; action = "<C-w>k"; }
      { mode = "n"; key = "<C-l>"; action = "<C-w>l"; }
      { mode = "n"; key = ";"; action = ":"; }
      { mode = "n"; key = ":"; action = ";"; }
    ];

### PLUGINS  ────────────────────────────────────────────────────────
    plugins = {
      lsp = {
        enable = true;
        servers = {
          nil-ls.enable  = true;   # Nix
          clangd.enable  = true;   # C/C++
          pyright.enable = true;   # Python
          rust-analyzer = {
            enable       = true;   # Rust
            installCargo = false;
            installRustc = false;
          };
        };
      };
      lsp-lines.enable = true; 
      comment.enable = true;
      nvim-autopairs.enable = true;
      treesitter = {
        enable = true;
        nixGrammars = true;
        settings.highlight.enable = true;
      };
      telescope.enable = true;
      lualine.enable = true;
      gitsigns.enable = true;
      which-key.enable = true;
    };
  };
}       
