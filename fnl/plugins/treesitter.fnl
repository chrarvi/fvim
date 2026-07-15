(import-macros {: set! : set+} :hibiscus.vim)

(local M {1 :nvim-treesitter/nvim-treesitter
          :event :BufReadPost
          :dependencies [:nvim-treesitter/nvim-treesitter-textobjects]
          :build ":TSUpdate"})

(fn M.config []
  (local ts (require :nvim-treesitter))
  (ts.setup {:install_dir (.. (vim.fn.stdpath :data) :/site)})
  (local ensure-installed [:lua :fennel :python :zig])
  (local already-installed (ts.get_installed))
  (local parsers-to-install (: (: (vim.iter ensure-installed) :filter
                                  (fn [parser]
                                    (not (vim.tbl_contains already-installed
                                                           parser))))
                               :totable))
  (ts.install parsers-to-install)
  (vim.api.nvim_create_autocmd :FileType
                               {:callback (fn []
                                            (pcall vim.treesitter.start)
                                            (set vim.bo.indentexpr
                                                  "v:lua.require'nvim-treesitter'.indentexpr()"))}))

M
