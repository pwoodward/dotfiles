return {
  {
    "saghen/blink.cmp",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      completion = {
        list = { selection = { preselect = false, auto_insert = false } },
        documentation = { auto_show = false },
      },
      cmdline = {
        keymap = {
          preset = "inherit",
        },
      },
      keymap = {
        preset = "default",
        ["<CR>"] = false,
      },
    },
    opts_extend = { "sources.default" },
  },
}
-- vim: ts=2 sts=2 sw=2 et
