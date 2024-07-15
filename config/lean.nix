# Using plugin defaults
{
  plugins.lean = {
    enable = true;
    mappings = true;  # A number of default mappings
    infoview = {
      autoopen = true;
      autopause = false;
      width = 50;
      height = 20;
      horizontalPosition = "bottom";
      indicators = "auto";
      mappings = {
        "<CR>" = "click";
        "<Esc>" = "clear_all";
        "<LocalLeader><Tab>" = "goto_last_window";
        C = "clear_all";
        I = "mouse_enter";
        K = "click";
        gD = "go_to_decl";
        gd = "go_to_def";
        gy = "go_to_type";
        i = "mouse_leave";
      };
      showNoInfoMessage = false;
      showProcessing = true;
      useWidgets = true;
    };
    abbreviations.enable = true;
    ft.default = "lean";
    lsp.enable = true;
    progressBars = {
      enable = true;
      priority = 10;
    };
    stderr = {
      enable = true;
      height = 5;
      # e.g. to redirect stderr to vim.notify
      # onLines = "function(lines) vim.notify(lines) end";
    };
  };
}
