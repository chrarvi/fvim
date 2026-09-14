(import-macros {: map!} :hibiscus.vim)
(local {: gh} (require :functions))

(vim.pack.add [(gh :nvim-lua/plenary.nvim) (gh :FredeEb/tardis.nvim)])

(local tardis (require :tardis-nvim))
(tardis.setup {:keymap {:next :p
                        :prev :n
                        :quit :q
                        :revision_message :<C-m>
                        :commit :<C-a>}})

(map! [n] :<leader>gt :<cmd>Tardis<CR>)
