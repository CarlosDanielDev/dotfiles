return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })

      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 10000,
    },
  },

  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrevious<CR>", desc = "Previous tab" },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "solarized_dark",
      },
    },
  },

  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },

  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
            ██████╗ █████╗ ██████╗ ██╗      ██████╗ ███████╗██████╗  █████╗ ███╗   ██╗██╗███████╗██╗     ██████╗ ███████╗██╗   ██╗
            ██╔════╝██╔══██╗██╔══██╗██║     ██╔═══██╗██╔════╝██╔══██╗██╔══██╗████╗  ██║██║██╔════╝██║     ██╔══██╗██╔════╝██║   ██║
            ██║     ███████║██████╔╝██║     ██║   ██║███████╗██║  ██║███████║██╔██╗ ██║██║█████╗  ██║     ██║  ██║█████╗  ██║   ██║
            ██║     ██╔══██║██╔══██╗██║     ██║   ██║╚════██║██║  ██║██╔══██║██║╚██╗██║██║██╔══╝  ██║     ██║  ██║██╔══╝  ╚██╗ ██╔╝
            ╚██████╗██║  ██║██║  ██║███████╗╚██████╔╝███████║██████╔╝██║  ██║██║ ╚████║██║███████╗███████╗██████╔╝███████╗ ╚████╔╝ 
            ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚══════╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚══════╝╚══════╝╚═════╝ ╚══════╝  ╚═══╝  
          ]],
        },
      },
    },
  },
}
