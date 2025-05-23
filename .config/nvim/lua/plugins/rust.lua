return {
  {
    "mrcjkb/rustaceanvim",
    version = "^5.0.0",
    lazy = false,
    config = function()
      local mason_regisry = require("mason-registry")
      local codelldb = mason_regisry.get_package("codelldb")
      local extension_path = codelldb:get_install_path() .. "/extension/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
      local cfg = require("rustaceanvim.config")

      vim.g.rustaceanvim = {
        dap = {
          adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
        },
      }
    end,
  },

  {
    "rust-lang/rust.vim",
    ft = { "rust" },
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  {
    "saecki/crates.nvim",
    ft = { "toml" },
    config = function()
      require("crates").setup(
        {
          completion = {
            cmp = {
              enabled = true,
            },
          },
        },
        require("cmp").setup.buffer({
          sources = {
            { name = "crates" },
          },
        })
      )
    end,
  },
}
