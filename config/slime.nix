# TODO: launch terminal if not already open
# TODO: launch ipython if not already open
# TODO: treesittre motions
{
  plugins.vim-slime = {
    enable = true;
    settings = {
      target = "kitty";
      python_ipython = 1;
      default_config = {
        window_id = "1";
	      listen_on = "unix:/tmp/mykitty";
      };
    };
  };
  extraConfigVim = ''
    let g:slime_no_mappings = 1
    nmap <c-c>v <Plug>SlimeConfig

    set operatorfunc=slime#send_op

    function SlimeOverrideConfig()
      let b:slime_config = {}
      if !exists("b:slime_config")
        let b:slime_config = {"x_window_pid": "", "window_id": 1}
      end
      ""let b:slime_config["window_id"] = 1
      ""if v:shell_error || b:slime_config["window_id"] == $KITTY_WINDOW_ID
      ""  let b:slime_config["window_id"] = input("kitty window_id: ", b:slime_config["window_id"])
      ""endif

      let b:slime_config["x_window_id"] = trim(slime#common#system("xdotool selectwindow", []))
      let b:slime_config["x_window_pid"] = trim(slime#common#system("xdotool getwindowpid " .. b:slime_config["x_window_id"], []))
      let b:slime_config["listen_on"] = "unix:/tmp/mykitty-" .. b:slime_config["x_window_pid"]
      let b:slime_config["window_id"] = trim(slime#common#system("kitty @ --to " .. b:slime_config["listen_on"] .. " ls | jq '.[] | select(.platform_window_id == " .. b:slime_config["x_window_id"] .. ").tabs[0].windows[0].id'", []))

    endfunction
  '';
  keymaps = [
    # Buffers
    # TODO: how to not rely on operatorfunc?
    {
      mode = "n";
      key = "<C-cr>";
      action = "0g@}}";
      options.desc = "Slime send paragraph";
    }
    {
      mode = "x";
      key = "<C-cr>";
      action = "<Plug>SlimeRegionSend<cr>";
      options.desc = "Slime send selection";
    }
    {
      mode = "n";
      key = "<S-cr>";
      action = "0g@jj";
      options.desc = "Slime send current line";
    }
  ];
}
