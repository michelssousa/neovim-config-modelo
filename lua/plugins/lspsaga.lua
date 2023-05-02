return {
  "glepnir/lspsaga.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = function()
    return {
      ui = {
        kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
      },
      diagnostic = {
        on_insert = false,
        on_insert_follow = false,
        show_virt_line = false,
        show_code_action = false,
      },
      outline = {
        win_width = 40,
        keys = {
          expand_or_jump = "o",
          quit = "q",
        },
      },
      hover = {
        max_width = 0.5,
      },
      code_action = {
        num_shortcut = true,
        show_server_name = true,
        extend_gitsigns = true,
        keys = {
          quit = "q",
          exec = "<CR>",
        },
      },
      symbol_in_winbar = {
        separator = "  ",
        show_file = false,
      },
    }
  end,
}
