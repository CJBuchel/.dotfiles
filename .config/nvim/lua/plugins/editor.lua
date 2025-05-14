return {
  {
    "mfussenegger/nvim-dap",
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require("dapui").setup()
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.completion = {
        autocomplete = false,
      }

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        -- Manually trigger completion menu
        ["<C-Space>"] = cmp.mapping.complete(),

        -- Accept completion with Tab
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),

        -- Make Enter insert a newline instead of accepting
        ["<CR>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.close()
            fallback()
          else
            fallback()
          end
        end),

        -- Dismiss completion menu
        ["<C-e>"] = cmp.mapping.abort(),
      })
      return opts
    end,

    -- Test
  },
}
