(import-macros {: set! : set+} :hibiscus.vim)
(local {: gh} (require :functions))

(vim.api.nvim_create_autocmd :PackChanged
                             {:callback (fn [ev]
                                          (let [name ev.data.spec.name
                                                kind ev.data.kind]
                                            (when (and (= name :nvim-treesitter)
                                                       (or (= kind :install)
                                                           (= kind :update)))
                                              (vim.cmd "packadd nvim-treesitter")
                                              (vim.cmd :TSUpdate))))})

(vim.pack.add [(gh :nvim-treesitter/nvim-treesitter-textobjects)
               (gh :nvim-treesitter/nvim-treesitter)])

(local treesitter (require :nvim-treesitter))

(treesitter.install [:python
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
                     :sql])

; Neovim's ftplugin does not contain fennel
(vim.api.nvim_create_autocmd :FileType
  {:pattern :fennel
   :callback (fn [ev]
               (vim.treesitter.start ev.buf :fennel))})
