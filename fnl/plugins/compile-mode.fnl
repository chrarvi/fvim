(import-macros {: map!} :hibiscus.vim)
(import-macros {: g!} :hibiscus.vim)
(local {: require-and : gh} (require :functions))

(vim.pack.add [
 (gh :nvim-lua/plenary.nvim)
 (gh :m00qek/baleia.nvim)
 (gh :ej-shafran/compile-mode.nvim)
])

(local compile (require :compile-mode))
(g! compile_mode {:baleia_setup true})
(map! [n] :<leader>pc "<cmd>Compile<CR>")
