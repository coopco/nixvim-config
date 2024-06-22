{
  # Import all your configuration modules here
  imports = [ 
    ./bufferline.nix
    ./conform.nix
    ./coq.nix
    ./dressing.nix
    ./fidget.nix
    ./flash.nix
    ./gitsigns.nix
    ./headlines.nix
    ./indent-blankline.nix
    ./lsp.nix
    ./lualine.nix
    ./mini.nix
    #./neogit.nix
    ./neo-tree.nix
    ./persistence.nix
    ./slime.nix
    ./spectre.nix
    ./snippets.nix
    ./telescope.nix
    ./todo-comments.nix
    ./treesitter.nix
    ./trouble.nix
    ./which-key.nix
  ];
  colorschemes.catppuccin.enable = true;
  globals.mapleader = " ";
  viAlias = true;
  clipboard.providers.xclip.enable = true;

  keymaps = [
    {
      mode = "n";
      key = "<leader>f";
      action = "+find/file";
    }

    # Buffers
    {
      mode = "n";
      key = "<S-h>";
      action = "<cmd>bprevious<cr>";
      options.desc = "Prev Buffer";
    }
    {
      mode = "n";
      key = "<S-l>";
      action = "<cmd>bnext<cr>";
      options.desc = "Next Buffer";
    }
    {
      mode = "n";
      key = "[b";
      action = "<cmd>bprevious<cr>";
      options.desc = "Prev Buffer";
    }
    {
      mode = "n";
      key = "]b";
      action = "<cmd>bnext<cr>";
      options.desc = "Next Buffer";
    }
    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>bp|bd #<cr>";
      options.desc = "Delete Buffer";
    }
    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>bd<cr>";
      options.desc = "Delete Buffer and Window";
    }
  ];
}
