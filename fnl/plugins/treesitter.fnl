(import-macros {: set! : set+} :hibiscus.vim)
(local {: require-and : gh} (require :functions))

;; Must be registered before vim.pack.add() so it also runs after
;; the initial installation.
(vim.api.nvim_create_autocmd :PackChanged
                             {:callback (fn [ev]
                                          (let [name ev.data.spec.name
                                                kind ev.data.kind]
                                            (when (and (= name :nvim-treesitter)
                                                       (or (= kind :install)
                                                           (= kind :update)))
                                              ;; PackChanged happens after the plugin has changed, but
                                              ;; make sure it is loaded before invoking TSUpdate.
                                              (vim.cmd "packadd nvim-treesitter")
                                              (vim.cmd :TSUpdate))))})

(vim.pack.add [(gh :nvim-treesitter/nvim-treesitter-textobjects)
               (gh :nvim-treesitter/nvim-treesitter)])

(require-and :nvim-treesitter #($.install [:python
                                           :markdown
                                           :markdown_inline
                                           :c
                                           :cpp
                                           :cuda
                                           :zig
                                           :rust
                                           :dockerfile
                                           :diff
                                           :fennel
                                           :json
                                           :yaml
                                           :toml
                                           :sql]))
