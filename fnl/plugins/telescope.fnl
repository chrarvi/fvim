(import-macros {: map!} :hibiscus.vim)

(local M
       {1 :nvim-telescope/telescope.nvim
        :lazy false
        :config true
        :dependencies [:nvim-lua/plenary.nvim
                       {1 :nvim-telescope/telescope-fzf-native.nvim
                        :build "make"}
                       {1 :nvim-telescope/telescope-file-browser.nvim}]})

(fn M.config []
  (local telescope (require :telescope))
  (local actions (require :telescope.actions))
  (local fb_actions telescope.extensions.file_browser.actions)
  (telescope.setup {:extensions {:fzf {:fuzzy true
                                       :override_generic_sorter true
                                       :override_file_sorter true
                                       :case_mode :smart_case}
                                 :file_browser {:theme :ivy
                                                :mappings {
                                                :i {
                                                :^ fb_actions.goto_parent_dir
                                                :<Tab> actions.select_default
                                                }
                                                }}}
                    :defaults {:border true
                               :borderchars [" "
                                             " "
                                             "─"
                                             " "
                                             " "
                                             " "
                                             " "
                                             "─"]
                               :layout_config {;; Layout that resembles emacs's vertico+consult
                                               :anchor :S
                                               :prompt_position :bottom
                                               :width {:padding 0}
                                               :height 0.99}
                               :layout_strategy :vertical
                               :file_ignore_patterns ["%.git"]
                               :vimgrep_arguments [:rg
                                                   :--color=never
                                                   :--no-heading
                                                   :--with-filename
                                                   :--line-number
                                                   :--column
                                                   :--smart-case
                                                   :--no-ignore
                                                   :--hidden]
                               :find_command {:hidden true}}})
  (local builtin (require :telescope.builtin))
  (local utils (require :telescope.utils))
  (telescope.load_extension :fzf)
  (telescope.load_extension :file_browser)
  (map! [n] :<leader>ht builtin.help_tags)
  (map! [n] :<leader>hm builtin.keymaps)
  (map! [n] :<leader>pf
        (fn []
          (builtin.find_files {:cwd (. (vim.fn.systemlist "git rev-parse --show-toplevel")
                                       1)
                               :hidden true
                               :ignore true})))
  (map! [n] :<leader>ff
        (fn []
          (telescope.extensions.file_browser.file_browser {:cwd (utils.buffer_dir)
                                                           :hidden true
                                                           :no_ignore true
                                                           :follow_symlinks true
                                                           :ignore true})))
  (map! [n] :<leader>hh builtin.builtin)
  (map! [n] :<leader>s/
        (fn []
          (builtin.live_grep {:cwd (utils.buffer_dir)})))
  (map! [n] :<leader>/
        (fn []
          (builtin.live_grep {:cwd (. (vim.fn.systemlist "git rev-parse --show-toplevel")
                                      1)})))
  (map! [n] :<leader>sb builtin.current_buffer_fuzzy_find)
  (map! [n] :<leader>le (fn [] (builtin.diagnostics {:bufnr 0})))
  (map! [n] :<leader>lE (fn [] (builtin.diagnostics {:bufnr nil})))
  (map! [n] :<leader>fr builtin.oldfiles)
  (map! [n] :<leader>bb builtin.buffers))

M

