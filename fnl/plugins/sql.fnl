(import-macros {: map!} :hibiscus.vim)
(local {: gh} (require :functions))

(vim.pack.add [(gh :tpope/vim-dadbod)
               (gh :kristijanhusak/vim-dadbod-completion)
               (gh :kristijanhusak/vim-dadbod-ui)])

(map! [n] :<leader>od :<cmd>DBUIToggle<CR>)
