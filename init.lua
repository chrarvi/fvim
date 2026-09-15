vim.pack.add({
	"https://github.com/udayvir-singh/tangerine.nvim",
	"https://github.com/udayvir-singh/hibiscus.nvim"
})

require("tangerine").setup({
  --target = vim.fn.stdpath [[data]] .. "/tangerine",

  compiler = {
    -- disable popup showing compiled files
    verbose = false,

    -- compile every time changed are made to fennel files or on entering vim
    hooks = { "onsave", "oninit" },
  },
  keymaps = {},
})
