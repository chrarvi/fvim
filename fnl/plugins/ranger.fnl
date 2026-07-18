(import-macros {: map!} :hibiscus.vim)

(local M {1 :kelly-lin/ranger.nvim})

(fn M.config [] 
    (local r (require :ranger-nvim))
    (r.setup {})
    (map! [n] :<leader>or (fn [] (r.open true))))

M
