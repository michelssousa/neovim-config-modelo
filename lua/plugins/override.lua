return {
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
    "lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.options = {
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

      vim.list_extend(opts.extensions, {
        "mason",
        "trouble",
        "quickfix",
        "nvim-dap-ui",
        "toggleterm",
        "man",
      })
    end,
  },

  {
    "nvim-lspconfig",
    opts = {
      servers = {
        bashls = {},
        cssls = {},
        html = {
          init_options = {
            provideFormatter = false,
          },
        },
        nil_ls = {},
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
    opts = function(_, opts)
      opts.ui = {
        icons = {
          package_installed = "✓",
          package_uninstalled = "✗",
          package_pending = "⟳",
        },
      }

      vim.list_extend(opts.ensure_installed, {
        "actionlint",
        "golangci-lint",
        "shellcheck",
      })
    end,
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

      opts.window = {
        completion = {
          border = "rounded",
        },
        documentation = {
          border = "rounded",
        },
      }

      opts.mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
      })
    end,
  },

  {
    "which-key.nvim",
    opts = {
      window = {
        border = "rounded",
      },
    },
  },

  {
    "nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "css",
        "scss",
        "vue",
        "nix",
      })
      opts.textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["ak"] = { query = "@block.outer", desc = "around block" },
            ["ik"] = { query = "@block.inner", desc = "inside block" },
            ["ac"] = { query = "@class.outer", desc = "around class" },
            ["ic"] = { query = "@class.inner", desc = "inside class" },
            ["a?"] = { query = "@conditional.outer", desc = "around conditional" },
            ["i?"] = { query = "@conditional.inner", desc = "inside conditional" },
            ["af"] = { query = "@function.outer", desc = "around function " },
            ["if"] = { query = "@function.inner", desc = "inside function " },
            ["al"] = { query = "@loop.outer", desc = "around loop" },
            ["il"] = { query = "@loop.inner", desc = "inside loop" },
            ["aa"] = { query = "@parameter.outer", desc = "around argument" },
            ["ia"] = { query = "@parameter.inner", desc = "inside argument" },
          },
        },
      }
    end,
  },

  {
    "bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
      },
    },
  },

  {
    "noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
      lsp = {
        progress = {
          enabled = false,
        },
      },
    },
  },

  {
    "telescope.nvim",
    opts = {
      defaults = {
        layout_config = {
          prompt_position = "top",
          horizontal = {
            preview_cutoff = 80,
            width = 0.9,
          },
        },
        sorting_strategy = "ascending",
      },
    },
  },

  {
    "nvim-lint",
    opts = {
      linters_by_ft = {
        yaml = { "actionlint" },
        go = { "golangcilint" },
        sh = { "shellcheck" },
      },
    },
  },

  {
    "aerial.nvim",
    opts = {
      layout = {
        width = 40,
      },
    },
  },

  {
    "vim-illuminate",
    opts = {
      filetypes_denylist = { "lazy", "aerial", "mason", "trouble", "Trouble" },
    },
  },

  {
    "catppuccin",
    opts = {
      show_end_of_buffer = true,
      term_colors = true,
      integrations = {
        telescope = {
          style = "nvchad",
        },
      },
    },
  },
}
