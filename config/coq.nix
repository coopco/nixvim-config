{
  plugins.coq-nvim = {
    enable = true;
    settings = {
      keymap = {
        recommended = true;
        pre_select = true;
      };
      auto_start = true;
      display.pum.y_max_len = 5;
    };
  };
}
