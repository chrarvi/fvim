(import-macros {: map!} :hibiscus.vim)

(local M {1 :jakemason/ouroboros.nvim})

  (fn setup-ouboros-binding []
    (vim.api.nvim_create_autocmd "FileType"
                                 {:pattern ["c" "cpp" "h" "hpp"]
                                 :callback (fn []
                                             (vim.keymap.set "n" "<C-e>" ":Ouroboros<CR>" {:buffer true}))}))

(fn M.config [] 
  (setup-ouboros-binding))

M
