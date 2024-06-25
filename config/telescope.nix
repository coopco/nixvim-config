{ mkKey, ... }:
let inherit (mkKey) mkKeymap;
in {
  plugins.telescope = {
    enable = true;
    settings.defaults = {
      prompt_prefix = " ";
      selection_caret = " ";
    };
  };

  keymaps = [
    (mkKeymap "n" "<leader>/" "<cmd>Telescope live_grep<cr>" "Search Live Grep")
    (mkKeymap "v" "<leader>/" "<cmd>Telescope live_grep<cr>" "Search Live Grep")
    (mkKeymap "n" "<leader><space>" "<cmd>Telescope find_files<cr>" "Find Files")

    # Files
    (mkKeymap "n" "<leader>fb" "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>" "Buffers")
    (mkKeymap "n" "<leader>ff" "<cmd>Telescope find_files<cr>" "Files")
    (mkKeymap "n" "<leader>fg" "<cmd>Telescope git_files<cr>" "Git Files")
    (mkKeymap "n" "<leader>fr" "<cmd>Telescope oldfiles<cr>" "Recent Files")
    # Git
    (mkKeymap "n" "<leader>gc" "<cmd>Telescope git_commits<CR>" "Commits")
    (mkKeymap "n" "<leader>gs" "<cmd>Telescope git_status<CR>" "Status")

    # Search
    (mkKeymap "n" "<leader>s\"" "<cmd>Telescope registers<cr>" "Registers")
    (mkKeymap "n" "<leader>sa" "<cmd>Telescope autocommands<cr>" "Auto Commands")
    (mkKeymap "n" "<leader>sb" "<cmd>Telescope current_buffer_fuzzy_find<cr>" "Buffer Fuzzy Finder")
    (mkKeymap "n" "<leader>sc" "<cmd>Telescope command_history<cr>" "Buffer Diagnostics")
    (mkKeymap "n" "<leader>sC" "<cmd>Telescope commands<cr>" "Buffer Diagnostics")
    (mkKeymap "n" "<leader>sd" "<cmd>Telescope diagnostics bufnr=0<cr>" "Buffer Diagnostics")
    (mkKeymap "n" "<leader>sD" "<cmd>Telescope diagnostics<cr>" "Workspace Diagnostics")
    (mkKeymap "n" "<leader>sh" "<cmd>Telescope help_tags<cr>" "Help Pages")
    (mkKeymap "n" "<leader>sH" "<cmd>Telescope highlights<cr>" "Highlight Groups")
    (mkKeymap "n" "<leader>sk" "<cmd>Telescope keymaps<cr>" "Keymaps")
    (mkKeymap "n" "<leader>sl" "<cmd>Telescope loclist<cr>" "Location List")
    (mkKeymap "n" "<leader>sm" "<cmd>Telescope marks<cr>" "Marks")
    (mkKeymap "n" "<leader>so" "<cmd>Telescope vim_options<cr>" "Vim Options")
    (mkKeymap "n" "<leader>st" "<cmd>Telescope<cr>" "Telescope")
    (mkKeymap "n" "<leader>sq" "<cmd>Telescope quickfix<cr>" "Quickfix List")

    # LSP
    (mkKeymap "n" "<leader>ss" "<cmd>Telescope lsp_document_symbols<cr>" "Goto Symbol")
    (mkKeymap "n" "<leader>sS" "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>" "Goto Symbol (Workspace)")
  ];
}
