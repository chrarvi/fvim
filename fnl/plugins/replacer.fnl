(import-macros {: map!} :hibiscus.vim)
(local {: gh} (require :functions))

(vim.pack.add [(gh :gabrielpoca/replacer.nvim)])

(map! [n] :<leader>si "<cmd>lua require('replacer').run()<cr>")
