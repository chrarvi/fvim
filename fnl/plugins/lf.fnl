(import-macros {: map!} :hibiscus.vim)
(local {: gh} (require :functions))

(vim.pack.add [(gh :akinsho/toggleterm.nvim) (gh :lmburns/lf.nvim)])

(local lf (require :lf))
(lf.setup {:escape_quit false :winblend 0})

(map! [n] :<leader>or lf.start)
