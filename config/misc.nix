{ pkgs, mkKey, ... }:
let inherit (mkKey) mkKeymap;
in {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "tiny-inline-diagnostic";
      src = pkgs.fetchFromGitHub {
        owner = "rachartier";
        repo = "tiny-inline-diagnostic.nvim";
        rev = "c40358cbd021f9862fa1ee20ec5ea2816aa8742d";
        hash = "sha256-BQj0oozhWfrMwaYIIcsCokAactWMQTLNnyhaR1EkICY=";
      };
    })
  ];
  keymaps = [
    (mkKeymap
      "n"
      "<leader>dl"
      "<cmd>lua toggle_diagnostics_and_virtualtext()<cr>"
      "Toggle single line diagnostics"
    )
  ];
  extraConfigLua = ''
    -- Toggle between single line and full buffer diagnostics
    vim.diagnostic.config({ virtual_text = false })
    function toggle_diagnostics_and_virtualtext()
      require("tiny-inline-diagnostic").toggle()
      local current_virtualtext = vim.diagnostic.config().virtual_text
      vim.diagnostic.config({ virtual_text = not current_virtualtext })
    end

    -- Default config
    require('tiny-inline-diagnostic').setup({
      signs = {
        left = "",
        right = "",
        diag = "●",
        arrow = "    ",
        up_arrow = "    ",
        vertical = " │",
        vertical_end = " └"
      },
      hi = {
        error = "DiagnosticError",
        warn = "DiagnosticWarn",
        info = "DiagnosticInfo",
        hint = "DiagnosticHint",
        arrow = "NonText",
        background = "CursorLine", -- Can be a highlight or a hexadecimal color (#RRGGBB)
        mixing_color = "None",  -- Can be None or a hexadecimal color (#RRGGBB). Used to blend the background color with the diagnostic background color with another color.
      },
      blend = {
        factor = 0.27,
      },
      options = {
        -- Throttle the update of the diagnostic when moving cursor, in milliseconds.
        -- You can increase it if you have performance issues.
        -- Or set it to 0 to have better visuals.
        throttle = 20,

        -- The minimum length of the message, otherwise it will be on a new line.
        softwrap = 15,

        overflow = {
          -- Manage the overflow of the message.
          -- 		- wrap: when the message is too long, it is then displayed on multiple lines.
          -- 		- none: the message will not be truncated, and will be displayed on a single line.
          mode = "wrap",

          -- The position of the overflow message.
          --	    - overlay: The message is displayed on top of the line. Do not move lines forward, it writes over the text.
          --      - eol: The message is displayed at the end of the line. Will move lines forward.
          position = "overlay",
        },

        --- Enable it if you want to always have message with `after` characters length.
        break_line = {
            enabled = false,
            after = 30,
        }
      }
    })
  '';
}
