{
  plugins = {
    treesitter = {
      enable = true;
      nixGrammars = true;
      settings.indent.enable = true;
    };
    treesitter-textobjects = {
      enable = true;
    };
    treesitter-context = {
      enable = true;
    };
    treesitter-refactor = {
      enable = true;
    };
    ts-autotag.enable = true;
    ts-context-commentstring.enable = true;
    rainbow-delimiters.enable = true;
  };
}
