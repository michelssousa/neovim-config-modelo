return {
  {
    "tokyonight.nvim",
    opts = {
      style = "night",
    },
  },

  {
    "rust-tools.nvim",
    opts = {
      tools = {
        inlay_hints = {
          auto = false,
        },
      },
    },
  },

  {
    "lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.options = {
        theme = "tokyonight",
        globalstatus = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      }
      opts.sections.lualine_a = {
        {
          "mode",
          fmt = function(mode) return " " .. mode end,
        },
      }
      opts.sections.lualine_y = {
        {
          function()
            return "Tab size: "
              .. vim.api.nvim_get_option_value("shiftwidth", {
                scope = "local",
              })
          end,
        },
      }
      opts.sections.lualine_z = {
        {
          "progress",
          fmt = function() return "%P/%L" end,
        },
      }
    end,
  },

  {
    "nvim-lspconfig",
    opts = {
      servers = {
        bashls = {},
        cssls = {},
        html = {},
        volar = {},
      },
      inlay_hints = {
        enabled = true,
      },
      diagnostics = {
        update_in_insert = true,
      },
    },
  },

  {
    "mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "󰗠 ",
          package_pending = " ",
          package_uninstalled = " ",
        },
      },
    },
  },

  {
    "neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["l"] = "open",
        },
      },
    },
  },

  {
    "LuaSnip",
    keys = function() return {} end,
    opts = {
      history = true,
      delete_check_events = "TextChanged",
      region_check_events = "CursorMoved",
    },
    config = function(_, opts) require("luasnip").config.setup(opts) end,
  },

  {
    "nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      local border_opts = {
        border = "rounded",
      }

      opts.preselect = cmp.PreselectMode.None

      opts.duplicates = {
        nvim_lsp = 1,
        luasnip = 1,
        cmp_tabnine = 1,
        buffer = 1,
        path = 1,
      }

      opts.window = {
        completion = cmp.config.window.bordered(border_opts),
        documentation = cmp.config.window.bordered(border_opts),
      }

      opts.mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<Tab>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
      })

      opts.sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 750 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
      })
    end,
  },

  {
    "nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "css",
        "scss",
        "vue",
        "nix",
        "xml",
        "kotlin",
        "groovy",
        "java",
      })
    end,
  },

  {
    "conform.nvim",
    opts = {
      formatters_by_ft = {
        java = { "google-java-format" },
      },
    },
  },
  {
    "mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "google-java-format" })
    end,
  },

  {
    "telescope.nvim",
    opts = {
      defaults = {
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
      },
    },
  },
}
