{
  plugins.lsp = {
    enable = true;
    servers = {
      gopls.enable = true;
      ruff-lsp.enable = true;
      pyright.enable = true;
      nixd.enable = true;
    };
  };
  plugins.lint.enable = true;
  plugins.clangd-extensions.enable = true;
  plugins.none-ls = {
    enable = true;
    sources = {
      diagnostics = {
        golangci_lint.enable = true;
        statix.enable = true;
      };
      formatting = {
        gofmt.enable = true;
        goimports.enable = true;
        nixfmt.enable = true;
        markdownlint.enable = true;
        shellharden.enable = true;
        shfmt.enable = true;
      };
    };
  };
}
