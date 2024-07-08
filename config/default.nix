{
  # Import all your configuration modules here
  imports = [ 
    ./bufferline.nix
    ./conform.nix
    ./coq.nix
    ./fidget.nix
    ./flash.nix
    ./gitsigns.nix
    ./headlines.nix
    ./indent-blankline.nix
    ./lsp.nix
    ./lualine.nix
    ./mini.nix
    ./misc.nix  # Miscellaneous plugins
    ./neo-tree.nix
    ./noice.nix
    #./neogit.nix
    ./obsidian.nix
    ./options.nix
    ./persistence.nix
    ./slime.nix
    ./snippets.nix
    ./spectre.nix
    ./telescope.nix
    ./todo-comments.nix
    ./treesitter.nix
    ./trouble.nix
    ./which-key.nix
  ];
  colorschemes.catppuccin.enable = true;
  globals = {
    mapleader = " ";
    maplocalleader = "\\";  # ??
    #autoformat = true;
    trouble_lualine = true;
  };
  viAlias = true;
  clipboard.providers.xclip.enable = true;

  # Many of these keymaps are from https://github.com/LazyVim/LazyVim
  keymaps = [
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
      key = "<leader>bb";
      action = "<cmd>b#<cr>";
      options.desc = "Last Buffer";
    }
    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>e #<cr>";
      options.desc = "Switch to Other Buffer";
    }
    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>bd<cr>";
      options.desc = "Delete Buffer and Window";
    }

    # Clear search with <esc>
    {
      mode = ["i" "n"];
      key = "<esc>";
      action = "<cmd>noh<cr><esc>";
      options.desc = "Escape and Clear hlsearch";
    }

    # Move to window using the <ctrl> hjkl keys
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h"; 
      options = {
        remap = true;
        desc = "Go to Left Window";
      };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options = {
        remap = true;
        desc = "Go to Lower Window";
      };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options = {
        remap = true;
        desc = "Go to Upper Window";
      };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options = {
        remap = true;
        desc = "Go to Right Window";
      };
    }
    
    # Swap Lines
    {
      mode = "n";
      key = "<A-j>";
      action = "<cmd>m .+1<cr>==";
      options.desc = "Swap Down";
    }
    {
      mode = "n";
      key = "<A-k>";
      action = "<cmd>m .-2<cr>==";
      options.desc = "Swap Up";
    }
    {
      mode = "i";
      key = "<A-j>";
      action = "<esc><cmd>m .+1<cr>==gi";
      options.desc = "Swap Down";
    }
    {
      mode = "i";
      key = "<A-k>";
      action = "<esc><cmd>m .-2<cr>==gi";
      options.desc = "Swap Up";
    }
    {
      mode = "v";
      key = "<A-j>";
      action = ":m '>+1<cr>gv=gv";
      options.desc = "Swap Down";
    }
    {
      mode = "v";
      key = "<A-k>";
      action = ":m '<-2<cr>gv=gv";
      options.desc = "Swap Up";
    }
    
    # Clear search, diff update and redraw
    # taken from runtime/lua/_editor.lua
    {
      mode = "n";
      key = "<leader>ur";
      action = "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>";
      options.desc = "Redraw / Clear hlsearch / Diff Update";
    }
    
    # https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
    {
      mode = "n";
      key = "n";
      action = "'Nn'[v:searchforward].'zv'";
      options = {
        expr = true;
	desc = "Next Search Result";
      };
    }
    {
      mode = "x";
      key = "n";
      action = "'Nn'[v:searchforward]";
      options = {
        expr = true;
        desc = "Next Search Result";
      };
    }
    {
      mode = "o";
      key = "n";
      action = "'Nn'[v:searchforward]";
      options = {
        expr = true;
        desc = "Next Search Result";
      };
    }
    {
      mode = "n";
      key = "N";
      action = "'nN'[v:searchforward].'zv'";
      options = {
        expr = true;
        desc = "Prev Search Result";
      };
    }
    {
      mode = "x";
      key = "N";
      action = "'nN'[v:searchforward]";
      options = {
        expr = true;
        desc = "Prev Search Result";
      };
    }
    {
      mode = "o";
      key = "N";
      action = "'nN'[v:searchforward]";
      options = {
        expr = true;
        desc = "Prev Search Result";
      };
    }
    
    # Add undo break-points
    {
      mode = "i";
      key = ",";
      action = ",<c-g>u";
    }
    {
      mode = "i";
      key = ".";
      action = ".<c-g>u";
    }
    {
      mode = "i";
      key = ";";
      action = ";<c-g>u";
    }
    
    # Save file
    {
      mode = ["i" "x" "n" "s"]; 
      key = "<C-s>";
      action = "<cmd>w<cr><esc>"; 
      options.desc = "Save File";
    }
    
    # keywordprg
    {
      mode = "n";
      key = "<leader>K";
      action = "<cmd>norm! K<cr>";
      options.desc = "Keywordprg";
    }
    
    # better indenting
    {
      mode = "v";
      key = "<";
      action = "<gv";
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
    }
    
    # commenting
    {
      mode = "n";
      key = "gco";
      action = "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>";
      options.desc = "Add Comment Below";
    }
    {
      mode = "n";
      key = "gcO";
      action = "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>";
      options.desc = "Add Comment Above";
    }
    
    # new file
    {
      mode = "n";
      key = "<leader>fn";
      action = "<cmd>enew<cr>";
      options.desc = "New File";
    }
    
    {
      mode = "n";
      key = "<leader>xl";
      action = "<cmd>lopen<cr>";
      options.desc = "Location List";
    }
    {
      mode = "n";
      key = "<leader>xq";
      action = "<cmd>copen<cr>";
      options.desc = "Quickfix List";
    }
    
    # quit
    {
      mode = "n";
      key = "<leader>qq";
      action = "<cmd>qa<cr>";
      options.desc = "Quit All";
    }
    
    # Terminal Mappings
    {
      mode = "t";
      key = "<esc><esc>";
      action = "<c-\\><c-n>";
      options.desc = "Enter Normal Mode";
    }
    {
      mode = "t";
      key = "<C-h>";
      action = "<cmd>wincmd h<cr>";
      options.desc = "Go to Left Window";
    }
    {
      mode = "t";
      key = "<C-j>";
      action = "<cmd>wincmd j<cr>";
      options.desc = "Go to Lower Window";
    }
    {
      mode = "t";
      key = "<C-k>";
      action = "<cmd>wincmd k<cr>";
      options.desc = "Go to Upper Window";
    }
    {
      mode = "t";
      key = "<C-l>";
      action = "<cmd>wincmd l<cr>";
      options.desc = "Go to Right Window";
    }
    {
      mode = "t";
      key = "<C-/>";
      action = "<cmd>close<cr>";
      options.desc = "Hide Terminal";
    }
    {
      mode = "t";
      key = "<c-_>";
      action = "<cmd>close<cr>";
      options.desc = "which_key_ignore";
    }
    
    # windows
    {
      mode = "n";
      key = "<leader>ww";
      action = "<C-W>p";
      options = {
        remap = true;
        desc = "Other Window";
      };
    }
    {
      mode = "n";
      key = "<leader>wd";
      action = "<C-W>c";
      options = {
        remap = true;
        desc = "Delete Window";
      };
    }
    {
      mode = "n";
      key = "<leader>wj";
      action = "<C-W>s";
      options = {
        remap = true;
        desc = "Split Window Below";
      };
    }
    {
      mode = "n";
      key = "<leader>wl";
      action = "<C-W>v";
      options = {
        remap = true;
        desc = "Split Window Right";
      };
    }
    {
      mode = "n";
      key = "<leader>-";
      action = "<C-W>s";
      options = {
        remap = true;
        desc = "Split Window Below";
      };
    }
    {
      mode = "n";
      key = "<leader>|";
      action = "<C-W>v";
      options = {
        remap = true;
        desc = "Split Window Right";
      };
    }
  ];
}
