# TODO: pumwidth
# TODO: documentation size
# TODO: tab next item
{ mkKey, pkgs, ... }:
let inherit (mkKey) mkKeymap;
in {
  plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        mapping = {
          __raw = ''
            cmp.mapping.preset.insert({
              ['<C-b>'] = cmp.mapping.scroll_docs(-4),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<C-e>'] = cmp.mapping.abort(),
              ['<CR>'] = cmp.mapping.confirm({ select = true }),
              ["<Tab>"] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                      cmp.select_next_item()
                  --elseif luasnip.expand_or_jumpable() then
                  --    luasnip.expand_or_jump()
                  else
                      fallback()
                  end
              end, {"i", "s"}),
              ["<S-Tab>"] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                      cmp.select_prev_item()
                  elseif luasnip.jumpable(-1) then
                      luasnip.jump(-1)
                  else
                      fallback()
                  end
              end, {"i", "s"}),
            })
          '';
        };
        snippet = {
          expand = "function(args) require('luasnip').lsp_expand(args.body) end";
        };
        # TODO: split into relevant package .nix files
        sources = {
          __raw = ''
            cmp.config.sources({
              { name = 'nvim_lsp' },
              { name = 'latex_symbols' },
              { name = 'luasnip' },
              { name = 'vimtex' },
              -- { name = 'ultisnips' },
              -- { name = 'snippy' },
            }, {
              { name = 'buffer' },
            })
          '';
        };
      };
    };
    cmp-nvim-lsp = {
      enable = true;
    };
    cmp_luasnip = {
      enable = true;
    };
  };
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "cmp-vimtex";
      src = pkgs.fetchFromGitHub {
        owner = "micangl";
        repo = "cmp-vimtex";
        rev = "a64b1b5eec0460144c91c4f20a45c74b8ded48ae";
        hash = "sha256-CO70M+l/9c4vqNm0XloOTzGQTmogHbSwvUFKQxYGsuw=";
      };
    })
  ];

  # TODO: automatic in latex buffer
  # TODO: One keymap that toggles the textwidth between 0 and 80
  keymaps = [
    (mkKeymap "n" "<leader>ow" "<cmd>set textwidth=80<cr>" "Hard wrap text")
    (mkKeymap "n" "<leader>ou" "<cmd>set textwidth=0<cr>" "Don't wrap text")
  ];
}
