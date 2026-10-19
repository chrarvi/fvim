(import-macros {: map!} :hibiscus.vim)
(local {: gh} (require :functions))

(vim.pack.add [(gh :stevearc/oil.nvim)])

(local oil (require :oil))
(oil.setup { 
  :default_file_explorer true
  :watch_for_changes true 
  :view_options { :show_hidden true }
})


(map! [n] :<leader>. "<cmd>Oil<CR>")

