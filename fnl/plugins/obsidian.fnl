(import-macros {: map!} :hibiscus.vim)

(local M {1 :epwalsh/obsidian.nvim :dependencies [:nvim-lua/plenary.nvim]})

(fn M.config []
  (local obsidian (require :obsidian))
  (obsidian.setup {:workspaces [{:name :personal :path "~/vaults/personal"}]
                   :attachments {:img_folder :assets/imgs}
                   :ui {:enable false}
                   :note_id_func (fn [title]
                                   (var suffix "")
                                   (if (not= title nil)
                                       (set suffix
                                            (: (: (title:gsub " " "-") :gsub
                                                  "[^A-Za-z0-9-]" "")
                                               :lower))
                                       (for [_ 1 4]
                                         (set suffix
                                              (.. suffix
                                                  (string.char (math.random 65
                                                                            90))))))
                                   (.. (tostring (os.time)) "-" suffix))
                   :picker {:name :fzf-lua}})
  (map! [n] :<leader>nn :<cmd>ObsidianNew<CR>)
  (map! [n] :<leader>nf :<cmd>ObsidianQuickSwitch<CR>)
  (map! [n] :<leader>n/ :<cmd>ObsidianSearch<CR>)
  (map! [n] :<leader>nP :<cmd>ObsidianPasteImg<CR>))

M
