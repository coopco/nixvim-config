# TODO: signs
# TODO: hotkeys
#  breakpoint
# TODO: how to have interactive terminal
{
  plugins.dap = {
    enable = true;
    extensions = {
      dap-go = {
        enable = true;
      };
      dap-python = {
        enable = true;
      };
      dap-ui = {
        enable = true;
        # TODO: default config
      };
      dap-virtual-text = {
        enable = true;
        enabledCommands = true;
      };
    };
  };
}
