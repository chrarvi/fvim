(local {: gh} (require :functions))

(vim.pack.add [(gh :jakemason/ouroboros.nvim)])
(vim.api.nvim_create_autocmd :FileType
                             {:pattern [:c :cpp :h :hpp]
                              :callback (fn []
                                          (vim.keymap.set :n :<C-e>
                                                          ":Ouroboros<CR>"
                                                          {:buffer true}))})
