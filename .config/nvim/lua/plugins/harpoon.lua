return {

  "ThePrimeagen/harpoon",
  lazy = true,
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {

    --{"<leader><leader>", function()	end },
    {
      "<leader>ha",
      function()
        require("harpoon.mark").add_file()
      end,
      desc = "Harpoon Mark",
    },
    --	{"<C-e>", function() require('harpoon.ui').toggle_quick_menu() end},
    {
      "<leader>hh",
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      desc = "Harpoon Menu",
    },
    {
      "<leader>hj",
      function()
        require("harpoon.ui").nav_next()
      end,
      desc = "Harpoon Next",
    },
    {
      "<leader>hk",
      function()
        require("harpoon.ui").nav_prev()
      end,
      desc = "Harpoon Previous",
    },
  },
  config = function()
    require("harpoon").setup({

      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
    })
  end,
}
