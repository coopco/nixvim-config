# TODO: default config
{
  plugins.neogit = {
    enable = true;
  };
  keymaps = [
    # Buffers
    {
      mode = "n";
      key = "<leader>G";
      action = "<cmd>Neogit<cr>";
      options.desc = "Neogit";
    }
  ];
}
