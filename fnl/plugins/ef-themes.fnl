(local {: gh} (require :functions))

(vim.pack.add [(gh :oonamo/ef-themes.nvim)])

(local ef (require :ef-themes))
(ef.setup {:light :ef-spring
           :dark :ef-dream
           :transparent false
           :styles {:comments {:italic false}
                    :modules {:mini true :treesitter true}}
           :options {:compile true
                     :compile_path (.. (vim.fn.stdpath :cache) :/ef-themes)}
           :on_colors (fn [colors name]
                        (set colors.yellow colors.yellow_cooler))})

(vim.cmd "colorscheme ef-theme")
