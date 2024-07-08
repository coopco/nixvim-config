#  Mostly copied from LazyVim
{
  opts = {
    number = true;
    relativenumber = true;
    splitbelow = true;
    splitright = true;

    conceallevel = 2;
    confirm = true;  # Confirm closing buffer with changes
    cursorline = true;  # Highlight current line
    expandtab = true;  # Use spaces instead of tabs

    grepprg = "rg -- vimgrep";  # TODO: rg dependency
    ignorecase = true;  # Ignore case
    inccommand = "nosplit";  # Preview incremental substitute

    jumpoptions = "view";  # Acoid scrolling when switching buffers

    laststatus = 3;  # global statusline
    linebreak = true;  # Wrap lines
    list = true;  # Show some invisible characters (e.g. tabs)

    mouse = "a";  # Mouse mode

    pumblend = 10;  # Popup menu transparency
    pumheight = 0;  # Maximum popup menu items

    scrolloff = 4;  # Mimimal number of lines to keep above/below cursor
    sidescrolloff = 8;  # Columns

    # What to save in a session
    # Leave out tabpages to have separate session for each tabpage
    sessionoptions = [ "buffers" "curdir" "folds" "globals" 
                       "help" "terminal" "winsize" "skiprtp" ];

    shiftround = true;  # Indentation rounding
    shiftwidth = 2;  # Size of indent
    tabstop = 2;  # Number of spaces tabs count for

    shortmess = "filnxtToOFWIcC";

    showmode = false;  # Made redundant by statusline
    signcolumn = "yes";  # Always show sign column

    termguicolors = true;

    timeoutlen = 300;  # Lower than default for which-key

    undofile = true;  # Persistent undo
    undolevels = 10000;

    updatetime = 200;  # Delay before saving swap file and triggering CursorHold

    virtualedit = "block";
    wildmode = "longest:full,full";  # Completion mode

    wrap = false;  # Disable line wrap

    foldmethod = "indent";
    foldlevel = 99;  # Default fold level on open
  };
}
