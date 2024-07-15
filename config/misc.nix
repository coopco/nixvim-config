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
    (pkgs.vimUtils.buildVimPlugin {
      name = "actions-preview";
      src = pkgs.fetchFromGitHub {
        owner = "aznhe21";
        repo = "actions-preview.nvim";
        rev = "9f52a01c374318e91337697ebed51c6fae57f8a4";
        hash = "sha256-lYjsv8y1fMuTGpBF/iG7cm/a7tLdh748vJhVsSp/Iz8=";
      };
    })
    # TODO: previews with lsp not really working
    (pkgs.vimUtils.buildVimPlugin {
      name = "goto-preview";
      src = pkgs.fetchFromGitHub {
        owner = "rmagatti";
        repo = "goto-preview";
        rev = "1519ea3512828c944eed5b2bbb66a8f8deb92447";
        hash = "sha256-TyTijbaRUJjrVy3+fjR5WgRA30dNvawElFiOUb9HhuI=";
      };
    })
    #(pkgs.vimUtils.buildVimPlugin {
    #  name = "kitty-runner";
    #  src = pkgs.fetchFromGitHub {
    #    owner = "jghauser";
    #    repo = "kitty-runner.nvim";
    #    rev = "1d254d70696d87bc9c3842191b6e837e2b97edb6";
    #    hash = "sha256-z/azRo96gjCu0Cbb96gaHdb9b1UStsSrOu0hp56EfTM=";
    #  };
    #})
  ];
  keymaps = [
    # Pretty diagnostics
    (mkKeymap
      "n"
      "<leader>dl"
      "<cmd>lua toggle_diagnostics_and_virtualtext()<cr>"
      "Toggle single line diagnostics"
    )
    # actions-preview
    (mkKeymap
      [ "n" "v" ]
      "<leader>pa"
      "<cmd>lua require('actions-preview').code_actions()<CR>"
      "Preview code actions"
    )
    # goto-preview
    (mkKeymap
      "n"
      "<leader>pd"
      "<cmd>lua require('goto-preview').goto_preview_definition()<CR>"
      "Preview definition"
    )
    (mkKeymap
      "n"
      "<leader>pt"
      "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>"
      "Preview type definition"
    )
    (mkKeymap
      "n"
      "<leader>pi"
      "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>"
      "Preview implementation"
    )
    (mkKeymap
      "n"
      "<leader>pD"
      "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>"
      "Preview declaration"
    )
    (mkKeymap
      "n"
      "<leader>pc"
      "<cmd>lua require('goto-preview').close_all_win()<CR>"
      "Close all previews"
    )
    (mkKeymap
      "n"
      "<leader>pr"
      "<cmd>lua require('goto-preview').goto_preview_references()<CR>"
      "Preview references"
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
