(import-macros {: map!} :hibiscus.vim)
(local {: gh} (require :functions))

(vim.pack.add [(gh :f-person/git-blame.nvim)])

(local gitblame (require :gitblame))
(gitblame.setup {:enabled false})

(map! [n] :<leader>gB :<cmd>GitBlameToggle<CR>)

