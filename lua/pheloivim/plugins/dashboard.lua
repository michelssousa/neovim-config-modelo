return {
  "nvimdev/dashboard-nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  init = function()
    if vim.fn.argc() == 0 then require("dashboard") end
  end,
  opts = function()
    local logo = [[
       █████████  ░██   ░██  ████████  ██        ███████   ██
      ░██░░░░░░██ ░██   ░██ ░██░░░░░  ░██       ██░░░░░██ ░░ 
      ░██      ██ ░██   ░██ ░██       ░██      ░██    ░██  ██
      ░█████████  ░████████ ░███████  ░██      ░██    ░██ ░██
      ░██░░░░░░   ░██   ░██ ░██░░░░   ░██      ░██    ░██ ░██
      ░██         ░██   ░██ ░██       ░██      ░██    ░██ ░██
      ░██         ░██   ░██ ░████████ ░████████ ░███████  ░██
      ░░          ░░    ░░  ░░░░░░░░  ░░░░░░░   ░░░░░░    ░░ 
    ]]
    logo = string.rep("\n", 5) .. logo .. "\n\n"

    local opts = {
      theme = "doom",
      hide = {
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        center = {
          { action = "Telescope find_files", desc = " Find file", icon = " ", key = "f" },
          { action = "ene | startinsert", desc = " New file", icon = " ", key = "n" },
          { action = "Telescope oldfiles", desc = " Recent files", icon = " ", key = "r" },
          { action = "Telescope live_grep", desc = " Find text", icon = " ", key = "g" },
          { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
          { action = "NvimTreeToggle", desc = " Nvim Tree", icon = " ", key = "e" },
          { action = "qa", desc = " Quit", icon = " ", key = "q" },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }

    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "DashboardLoaded",
        callback = function() require("lazy").show() end,
      })
    end

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end
    return opts
  end,
}
