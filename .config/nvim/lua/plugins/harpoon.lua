return {

  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  lazy = true,
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>ha",
      function()
        require("harpoon"):list():add()
      end,
      desc = "Harpoon Mark",
    },
    {
      "<leader>hh",
      function()
        require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
      end,
      desc = "Harpoon Menu",
    },
    {
      "<leader>hj",
      function()
        require("harpoon"):list():next()
      end,
      desc = "Harpoon Next",
    },
    {
      "<leader>hk",
      function()
        require("harpoon"):list():prev()
      end,
      desc = "Harpoon Previous",
    },
    {
      "<leader>h1",
      function()
        require("harpoon"):list():select(1)
      end,
      desc = "Buffer 1",
    },
    {
      "<leader>h2",
      function()
        require("harpoon"):list():select(2)
      end,
      desc = "Buffer 2",
    },
    {
      "<leader>h3",
      function()
        require("harpoon"):list():select(3)
      end,
      desc = "Buffer 3",
    },
    {
      "<leader>h4",
      function()
        require("harpoon"):list():select(4)
      end,
      desc = "Buffer 4",
    },
    {
      "<leader>h5",
      function()
        require("harpoon"):list():select(5)
      end,
      desc = "Buffer 5",
    },
  },
  config = function()
    require("harpoon").setup()
  end,
}
