# TODO: fast snippets
{ pkgs, ... }:
{
  plugins = {
    vimtex = {
      enable = true;
      texlivePackage = pkgs.texlive.combined.scheme-full;
    };
    cmp-latex-symbols = {
      enable = true;
    };
  };
}
